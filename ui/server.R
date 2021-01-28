
library(shinydashboard)
library("googleAnalyticsR")

server <- function(input, output){ 
  
  output$progressBox <- renderInfoBox({
    infoBox(
      "Progress", paste0(value + input$count, "%"), icon = icon("list"),
      color = "purple"
    )
  })
  
  output$progressBox <- renderInfoBox({
    infoBox(
      "Sessão", "90", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  
  output$approvalBox3 <- renderInfoBox({
    infoBox(
      "Rejeição", "60%", icon = icon("remove-sign", lib = "glyphicon"),
      color = "red"
    )
  })
  
  output$approvalBox2 <- renderInfoBox({
    infoBox(
      "Transações", "0", icon = icon("piggy-bank", lib = "glyphicon"),
      color = "blue"
    )
  })
  
}

#shinyApp(ui, server)
