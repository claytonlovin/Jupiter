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
        tags$head(tags$style(HTML('
          .main-header .logo {
            font-weight: bold;
            font-size: 28px;
            
          }, 
          
        '))),
        
        #CSS    
        tags$body(tags$style(HTML('
            @media (min-width: 768px){
                 .col-sm-4{
                    width: 24%;
                }
            }
           
        '))),
        
        )
)



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
            "Transações", "R$ 80,00", icon = icon("piggy-bank", lib = "glyphicon"),
            color = "blue"
        )
    })
    
    }

shinyApp(ui, server)