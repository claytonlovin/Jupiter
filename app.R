## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = "purple",
                    
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
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Marketing", tabName = "widgets", icon = icon("th"))
            )
        ),
    
    #DASHBOARD BODY
    dashboardBody(
        
        #PRINT CONTENT BODY
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                            )
                    )
                ),
            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
            ),
        
    
        #CSS    
        tags$head(tags$style(HTML('
          .main-header .logo {
            font-weight: bold;
            font-size: 28px;
            
            .sidebar-menu a{
                margin-top: 20px;
            }
          }
        ')))
        )
)



server <- function(input, output) { }

shinyApp(ui, server)