
library(shinydashboard)
library("googleAnalyticsR")

server <- function(input, output){ 
  
  output$progressBox <- renderInfoBox({
    infoBox(
      "Usuários", paste0(users), icon = icon("scale", lib = "glyphicon"),
      color = "purple"
    )
  })
  
  output$progressBox1 <- renderInfoBox({
    infoBox(
      "Sessão", paste0(sessions), icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })

  
  output$approvalBox2 <- renderInfoBox({
    infoBox(
      "Transações", "0", icon = icon("piggy-bank", lib = "glyphicon"),
      color = "blue"
    )
  })
  
  output$approvalBox3 <- renderInfoBox({
    infoBox(
      "Rejeição", paste0(bounceRate, " %"), icon = icon("remove-sign", lib = "glyphicon"),
      color = "red"
    )
  })
  
}

#shinyApp(ui, server)
