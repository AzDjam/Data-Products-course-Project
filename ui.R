#
# This is the user-interface  of a Shiny web application. 
#
# 
library(shiny)



shinyUI(fluidPage(
  
  # Application title
  titlePanel(h2("Exploring package :datasets ")),
  sidebarLayout(
        # Sidebar panel for inputs 
        sidebarPanel(
          
          # Input: Selector for choosing dataset 
          selectInput(inputId = "dataset",
                      label = "select a dataset:",
                      choices = ls("package:datasets"),selected="mtcars"),
  
          # Input: Numeric entry for number of obs to view 
          numericInput(inputId = "obs",
                       label = "Number of observations to view:",
                       value = 10)
          
        ),
  
       mainPanel(
        tabsetPanel(type="tab",
          # Output: Verbatim text for data summary ----
          tabPanel("Summary",verbatimTextOutput("summary")),
          # Output: HTML table with requested number of observations ----
         tabPanel("VIew",tableOutput("view")),
         #output Verbatim text for data structure
         tabPanel("Structure",verbatimTextOutput("str"))
         
        )
       )
   )
 )
)