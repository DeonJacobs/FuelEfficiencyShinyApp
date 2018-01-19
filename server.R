#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(UsingR)
data(galton)

MpgPrediction <- function(horsepower){
 
  fit <- lm(mpg ~ hp,data=mtcars)
  fit2 <- lm(mpg ~ I(hp - mean(hp)),data=mtcars) #centering around the expected, or mean carat value
  pred <- predict(fit,newdata = data.frame(hp=horsepower))
  pred <- round(pred[[1]],digits= 2)
  pred
}

shinyServer(  
  function(input, output) {    
    
    output$newHist <- renderPlot({
      
      library(UsingR)
      library(ggplot2)
      data(mtcars)
      
      g <- ggplot(mtcars, aes(x=hp, y=mpg))
      g <- g + xlab("horse power")
      g <- g + ylab("miles per gallon")
      g <- g + geom_point(size=6, colour ="black", alpha=0.2)
      g <- g + geom_point(size=5,colour = "blue", alpha=0.2)
      g <- g + geom_smooth(method = "lm", color="black")
      g
    })  
   
    output$prediction <- renderPrint({MpgPrediction(input$hp)})
    
  }
)