## app.R ##
library(shiny)
library(shinydashboard)


ui <- dashboardPage(skin = "black",
                    
                    dashboardHeader(
                      #Left header
                      title = "Jupiter", titleWidth = 250,
                      
                      #Right Header
                      #dropdownMenu(type = "messages",
                            #       notificationItem(
                                #     text = "5 novas alterações",
                                 #    icon("users")
                                   #)),
                      
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
                        menuItem("Marketing", tabName = "Marketing", icon = icon("paper-plane")),
                        menuItem("Comportamento", tabName = "Comportamento", icon = icon("bicycle")),
                        menuItem("Aquisição", tabName = "Aquisição", icon = icon("money")),
                        menuItem("E-commerce", tabName = "E-commerce", icon = icon("shopping-basket"))
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
                                dateRangeInput("Data", strong("Período"), start = "2021-01-01", end = "2021-12-31",
                                                language = "pt-br", format ="dd-mm-yyyy", separator = "a" ),
                                fluidRow(
                                  
                                  infoBoxOutput("progressBox"),
                                  infoBoxOutput("progressBox1"),
                                  infoBoxOutput("approvalBox3"),
                                  infoBoxOutput("approvalBox2"),
                                  
                                  
                                  tabBox(
                                    title = "Engajamento",
                                    # The id lets us use input$tabset1 on the server to find the current tab
                                    id = "tabset1", height = "250px",
                                    tabPanel("Mídia", "Beta1"),
                                    tabPanel("Dispositivo", "Beta2")
                                  )
                                  
                                )
                        ),
                        
                        # SEGUNDO ITEM
                        tabItem(tabName = "Marketing",
                                h2("Dashboard de marketing")
                        ),
                        # TERCEIRO ITEM
                        tabItem(tabName = "Comportamento",
                                h2("Dashboard de Comportamento")
                        ),
                        # QUARTO ITEM
                        tabItem(tabName = "Aquisição",
                                h2("Dashboard de Aquisição")
                        ),
                        # QUINTO ITEM
                        tabItem(tabName = "E-commerce",
                                h2("Dashboard de E-commerce")
                        )
                      ),
                      ##END PRINT CONTENT BODY
                      
                      ### 
                      
                      
                      #CSS    
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
                      )
                      
                    )
)

