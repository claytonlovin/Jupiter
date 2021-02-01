
library(shinydashboard)
library("googleAnalyticsR")


### ACOUNT #############

ga_accounts <- ga_account_list()
#View(ga_accounts)

ga_id = 232608978 

ga_result1 <-google_analytics(ga_id,
                              date_range = c("2020-11-15", "2020-11-21"),
                              metrics = c("users"),
                              dimensions = "date")

ga_result2 <-google_analytics(ga_id,
                              date_range = c("2020-11-15", "2020-11-21"),
                              metrics = c("sessions"),
                              dimensions = "date")

ga_result3 <-google_analytics(ga_id,
                              date_range = c("2020-11-15", "2020-11-21"),
                              metrics = c("bounceRate"),
                              dimensions = "date")

users = sum(ga_result1[ , 2])
sessions = sum(ga_result2[ , 2])
bounceRate = sum(ga_result3[3, 2])


#SERVER ################

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

