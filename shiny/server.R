library(shiny)
shinyServer(function(input, output) {
  output$output <- renderText({
    # BCS selection 
    if(input$BCS == "1.5/2.0"){
      BCS = 0
    }
    else if(input$BCS == "2.5"){
      BCS = 0.02209
    }
    else if(input$BCS == "3.0"){
      BCS = 0.05858
    }
    else if(input$BCS == "3.5"){
      BCS = 0.09557
    }
    else if(input$BCS == "4.0"){
      BCS = 0.11447
    }
    
    # Age selection 
    if(input$Age == "<2"){
      Age = 0
    }
    else if(input$Age == "2-5"){
      Age = 0.05493
    }
    else if(input$Age == ">5"){
      Age = 0.08139
    }
    paste(exp(-7.37828) * exp(BCS) * exp(Age) * (input$girth)^1.44267 * (input$height)^0.54297 * (input$length)^0.63715, "kg")

  })
  
})