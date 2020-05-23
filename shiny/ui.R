library(shiny) # shiny==1.4.0.2

shinyUI(fluidPage(
  titlePanel("Donkey Weight Calculator"),
  sidebarLayout(
    mainPanel(
      h5("Input your values to see expected donkey weight!"),
      selectInput("BCS", "Select the BCS",
                  choices = c("1.5/2.0", "2.5", "3.0", "3.5", "4.0")),
      selectInput("Age", "Select the age (yr)",
                  choices = c("<2", "2-5", ">5")),
      numericInput("girth", "Girth (cm)", 0),
      numericInput("height", "Height (cm)", 0),
      numericInput("length", "Length (cm)", 0)
    ),
    mainPanel(
      h2("The donkey weight is expected to be:"),
      textOutput("output")
    ))))