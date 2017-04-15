#
# Developing Data Products Week 4 Assignment
#


library(shiny)

# Define UI for application that plots Apple Inc. Stock price
shinyUI(fluidPage(
  
# Application title
 h1("My First Application"),
 p("Author: Ng Kah Earn"),
 p("Date: 15 April 2017"),
 
  
# Sidebar with a slider input for number of years and checkbox to plot linear model
  sidebarLayout(
    sidebarPanel(
       sliderInput("years",
                   "Select the number of years:",
                   min = 1,
                   max = 10,
                   value = 5),
       checkboxInput("lm","Plot of linear model for the selected period",value = FALSE)
    ),
  
    
# Show of explanation, user guide and plot
    mainPanel
    (
    h2("Description"),
    p("This application plots Apple Incorporated daily stock closing price from 2nd January 2008 
       till 7th April 2017. Users can select the number of years to be plotted. There is also an 
      option to plot the linear model and the getting the linear growth rate for the selected 
      period."),
    h2("User Guide"),
    p("Users to select the number of years you want the application to plot. Selecting 1 on the slider 
       bar will tell the application to plot the current year Apple Incorporated daily stock 
       closing price. As the slider bar value increases by 1; The application will plot additional
       1 past year Apple Incorporated stock daily closing price. For example increasing the 
      slider bar value to 2 and the applciation will plot 2016 and 2017 Apple Incorporated stock 
      daily closing price. Users checking the check box will instruct the application to plot the linear
      model and the calculate the growth rate for the selected period."),
    br(),
    strong(textOutput("growth")),
    plotOutput("distPlot")
    )
  )
))
