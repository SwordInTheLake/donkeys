library(shiny)
shinyServer(function(input, output) {
  output$output <- renderText({
    # BCS selection 
    if(input$BCS == "1.5/2.0"){
      BCS = 0
    }
    else if(input$BCS == "2.5"){
      BCS = 0.02200
    }
    else if(input$BCS == "3.0"){
      BCS = 0.05846
    }
    else if(input$BCS == "3.5"){
      BCS = 0.09528
    }
    else if(input$BCS == "4.0"){
      BCS = 0.11334
    }
    
    # Age selection 
    if(input$Age == "<2"){
      Age = 0
    }
    else if(input$Age == "2-5"){
      Age = 0.05591
    }
    else if(input$Age == "5-10"){
      Age = 0.07574
    }
    else if(input$Age == "10-15"){
      Age = 0.08598
    }
    else if(input$Age == "15-20"){
      Age = 0.08544
    }
    else if(input$Age == ">20"){
      Age = 0.07547
    }
    paste(exp(-7.34347) * exp(BCS) * exp(Age) * (input$girth)^1.43417 * (input$height)^0.54784 * (input$length)^0.63319, "kg")

  })
  
})