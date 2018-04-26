#
# This is the server  of a Shiny web application. 
#

library(shiny)
library(ggplot2)
library(plotly)


shinyServer(function(input, output) {
 
 #get the dataset selected
  dataset <- reactive({
   
   get(input$dataset,"package:datasets",inherits=F)
    
 })
 
 #summary of the dataset
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  # Str of the dataset
  output$str <- renderPrint({
    str(dataset())
  })
  
  
   #  n first obsevations of the dataset
  output$view <- renderTable({
     head(dataset(),n = input$obs)
  })
  
 
  
})
