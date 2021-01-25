## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = "black",
                    
                    dashboardHeader(
                      #Left header
                      title = "Jupiter", titleWidth = 250,
                      
                      #Right Header
                      dropdownMenu(type = "messages",
                                   notificationItem(
                                     text = "5 novas alterações",
                                     icon("users")
                                   )),
                      
                      dropdownMenu(type = "tasks",
                                   notificationItem(
                                     text = "5 novas alterações",
                                     icon("users")
                                   ))
                      
                    ),
                    
                    #DASHBOARD SIDEBAR
                    dashboardSidebar(
                      width = 250,
                      sidebarMenu(
                        menuItem("Home", tabName = "dashboard", icon = icon("dashboard")),
                        menuItem("Marketing", tabName = "widgets", icon = icon("paper-plane")),
                        menuItem("Comportamento", tabName = "widgets", icon = icon("bicycle")),
                        menuItem("Aquisição", tabName = "widgets", icon = icon("money")),
                        menuItem("E-commerce", tabName = "widgets", icon = icon("shopping-basket"))
                      )
                    ),
                    
                    #DASHBOARD BODY
                    dashboardBody(
                      
                      ##PRINT CONTENT BODY
                      tabItems(
                        # First tab content
                        tabItem(tabName = "dashboard",
                                # SELECT DO PERÍODO
                                # Select date range to be plotted
                                dateRangeInput("date", strong("Período"), start = "2017-01-01", end = "2020-07-31",
                                               min = "2017-01-01", max = "2020-07-31"),
                                fluidRow(
                                  
                                  infoBox("Usuários", value= 20, icon = icon("scale", lib = "glyphicon")),
                                  infoBoxOutput("progressBox"),
                                  infoBoxOutput("approvalBox3"),
                                  infoBoxOutput("approvalBox2")
                                  
                                  
                                  
                                  
                                )
                        ),
                        
                        # Second tab content
                        tabItem(tabName = "widgets",
                                h2("Dashboard de marketing")
                        )
                      ),
                      ##END PRINT CONTENT BODY
                      
                      
                      
                      #CSS    
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
                      )
                      
                    )
)

