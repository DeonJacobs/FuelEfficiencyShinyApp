#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(pageWithSidebar(  
  headerPanel("Fuel Efficiency"),  
  sidebarPanel( 
    tagList("URL link:", a("App documentation", href="https://deonjacobs.shinyapps.io/DataProductsFuelEfficiencyAppDocument/")),
    p(" "),
    sliderInput('hp', 'Select horsepower',value = 200, min = 100, max = 300, step = 10),
    submitButton('Submit')
  ),
  mainPanel(    
    h3('Mpg vs. Hp Linear Regression Plot'),
    plotOutput('newHist'),
    h3('Miles per gallon prediction:'),
    verbatimTextOutput("prediction")
  )
))
