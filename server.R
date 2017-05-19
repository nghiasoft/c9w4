library(shiny)
library(plotly)

# Define server logic for application
shinyServer(function(input, output) {
    output$plot <- renderPlot({
        a = diamonds[which(diamonds$cut == input$cut),]

        ggplot(data=a) + geom_histogram(binwidth=100, aes(x=a$price)) +
            xlab("Diamond Price U$") + ylab("Frequency") +
            theme_minimal() + facet_wrap(~cut, scales="free_y")
    })
    
    # Generate a summary of the data
    output$summary <- renderPrint({
        summary(diamonds)
    })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
        a = diamonds[which(diamonds$cut == input$cut),]
        data.frame(x=a)
    })
})
