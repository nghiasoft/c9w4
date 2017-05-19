library(shiny)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Diamond Price Distribution by Cut"),

    sidebarPanel(
        radioButtons("cut", "Quality of the cut:",
                     list("Fair" = "Fair",
                          "Good" = "Good",
                          "Very Good" = "Very Good",
                          "Premium" = "Premium",
                          "Ideal" = "Ideal"))
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("plot")), 
            tabPanel("Summary", verbatimTextOutput("summary")), 
            tabPanel("Table", tableOutput("table"))
        )
    )
))
