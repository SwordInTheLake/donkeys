library(shiny)
shinyServer(function(input, output) {
  output$output <- renderText({
    # BCS selection 
    if(input$BCS == "1.5"){
      BCS = 1.5
    }
    else if(input$BCS == "2.0"){
      BCS = 2 
    }
    else if(input$BCS == "2.5"){
      BCS = 2.5
    }
    else if(input$BCS == "3.0"){
      BCS = 3
    }
    else if(input$BCS == "3.5"){
      BCS = 3.5 
    }
    else if(input$BCS == "4.0"){
      BCS = 4
    }
    
    # Age selection 
    if(input$Age == "<2"){
      Age = 2
    }
    else if(input$Age == "2-5"){
      Age = 3
    }
    else if(input$Age == "5-10"){
      Age = 5 
    }
    else if(input$Age == "10-15"){
      Age = 10
    }
    else if(input$Age == "15-20"){
      Age = 15
    }
    else if(input$Age == ">20"){
      Age = 20
    }
    
    paste(BCS + Age + input$girth + input$height + input$length, "kg")

  })
  
})