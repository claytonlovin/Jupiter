
library(shinydashboard)
library("googleAnalyticsR")

ga_accounts <- ga_account_list()
#View(ga_accounts)

ga_id = 232608978 

ga_results1 <-google_analytics(ga_id,
                               date_range = c("2020-11-15", "2020-11-21"),
                               metrics = c("users","sessions"),
                               dimensions = "date")

  
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
      "Transações", "120", icon = icon("piggy-bank", lib = "glyphicon"),
      color = "blue"
    )
  })
  
}

#shinyApp(ui, server)
