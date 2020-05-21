library(shiny)
shinyServer(function(input, output) {
  output$output <- renderText({
    # BCS selection 
    if(input$BCS == "1.5"){
      BCS = 0
    }
    else if(input$BCS == "2.0"){
      BCS = 0.0378
    }
    else if(input$BCS == "2.5"){
      BCS = 0.05471
    }
    else if(input$BCS == "3.0"){
      BCS = 0.09130
    }
    else if(input$BCS == "3.5"){
      BCS = 0.12829
    }
    else if(input$BCS == "4.0"){
      BCS = 0.14641
    }
    
    # Age selection 
    if(input$Age == "<2"){
      Age = 0
    }
    else if(input$Age == "2-5"){
      Age = 0.05494
    }
    else if(input$Age == "5-10"){
      Age = 0.07556
    }
    else if(input$Age == "10-15"){
      Age = 0.08544
    }
    else if(input$Age == "15-20"){
      Age = 0.08511
    }
    else if(input$Age == ">20"){
      Age = 0.07546
    }
    
    paste(exp(-7.36753) * exp(BCS) * exp(Age) * (input$girth)^1.43196 * (input$height)^0.55024 + (input$length)^0.63123, "kg")

  })
  
})