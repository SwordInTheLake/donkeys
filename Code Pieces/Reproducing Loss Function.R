train <- read.csv(file = '/Users/erictay1997/Desktop/donkeys/train_reproducing.csv')
train
n = nrow(train)
X <- matrix(NA, nrow = n, ncol = 3)
X[,1] <- rep(1,n)
X[,2] <- log(train$Length)
X[,3] <- log(train$Girth)
y <- 2*(sqrt(train$Weight) - 1)
theta<-c (-107,8,20)

#-107.0, 19.91, 7.712

cost <- function(X, y, par){
  J <- sum((X%*%par-y)^2)
  return(J) 
}

new_cost<-function(X, y, par, alpha){  
  m <- length(y)
  predictions = X%*%par
  relative_error = y/predictions - 1
  for (i in 1:length(relative_error)){
    if(relative_error[i]<0){
      relative_error[i]=relative_error[i]*alpha
    }
  }
  J <- sum((relative_error)^2)
  return(J) 
}

linex_cost<-function(X, y, par, alpha1, alpha2, weight){  
  m <- length(y)
  predictions = X%*%par
  relative_error = y/predictions - 1
  left = exp(alpha1*relative_error) - alpha1*relative_error - 1
  right = exp(alpha2*relative_error) - alpha2*relative_error - 1
  J <- sum(left*weight + right)
  return(J) 
}

for(i in 1:40){
  for(j in 1:40){
    alpha1 = -i
    alpha2 = j
    ret = optim(par = theta, fn = linex_cost, X = X, y = y, alpha1 = alpha1, alpha2 = alpha2, weight = 1)
    optimal = c(-107.0, 7.712, 19.91)
    residuals = sum((ret$par - optimal)^2)
    if (residuals < 0.1){
      print(j)
    }
  }
}

a = c()
for (i in 1:10){
  a[i] = i
}

alphas = seq(2.1, 2.25, by = 0.01)
for(i in 1:length(alphas)){
  ret = optim(par = theta, fn = new_cost, X = X, y = y, alpha = alphas[i])
  optimal = c(-107.0, 7.712, 19.91)
  residuals = sum((ret$par - optimal)^2)
  print(residuals)
  if (residuals<0.3){
    print(alphas[i])
  }
}

ret = optim(par = theta, fn = new_cost, X = X, y = y, alpha = 2.2)
ret$par

ret = optim(par = theta, fn = linex_cost, X = X, y = y, alpha1 = -39, alpha2 = 23, weight = 1)
ret$par
#, method = "BFGS"