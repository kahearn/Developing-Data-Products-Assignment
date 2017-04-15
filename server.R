#
# Developing Data Products Week 4 Assignment
# 
# http://shiny.rstudio.com/
#

# loading the required libraries

library(shiny)
library(quantmod)

# Downloading Apple Inc. Stock Info

from.dat <- as.Date("01/01/08", format="%m/%d/%y")
to.dat <- as.Date("07/04/17", format="%m/%d/%y")
getSymbols("AAPL", src="google", from = from.dat, to = to.dat)
Apple <- data.frame(AAPL)
Apple <- cbind(rownames(Apple),Apple)
Apple[,1] <- as.Date.factor(Apple[,1])


# Define server logic required to plot 
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
# generate years to be plotted based on input from ui.R
    if(input$years == 1) 
      AppleDate <- subset(Apple, Apple[,1]>"2016-12-31")
    else if (input$years == 2)
      AppleDate <- subset(Apple, Apple[,1]>"2015-12-31")
    else if (input$years == 3)
      AppleDate <- subset(Apple, Apple[,1]>"2014-12-31")
    else if (input$years == 4)
      AppleDate <- subset(Apple, Apple[,1]>"2013-12-31")
    else if (input$years == 5)
      AppleDate <- subset(Apple, Apple[,1]>"2012-12-31")
    else if (input$years == 6)
      AppleDate <- subset(Apple, Apple[,1]>"2011-12-31")
    else if (input$years == 7)
      AppleDate <- subset(Apple, Apple[,1]>"2010-12-31")
    else if (input$years == 8)
      AppleDate <- subset(Apple, Apple[,1]>"2009-12-31")
    else if (input$years == 9)
      AppleDate <- subset(Apple, Apple[,1]>"2008-12-31")
      else AppleDate <- Apple
    
     
      plot(AppleDate[,1],AppleDate[,5], type = "l", col = "blue",
         main = "Apple Inc. Stock Price",
         xlab =  "Date", ylab = "US Dollar ($)")
      
#  Ploting the linear model if the check box input is check     
       if(input$lm)
        {
        lmfit <- lm(AppleDate[,5]~AppleDate[,1])
        abline(lmfit, col = "red", lwd = 1.5)
        coeff<-format(round(lmfit$coefficients[2],4),nsmall = 2)
        text<-paste("The growth rate of Apple Inc. stock for the selected period is ", coeff," USD per day")
        output$growth <- renderText(text)
        }
        else 
        {
          text <- paste("")
          output$growth <- renderText(text)
        }
  
  })
  
})  
