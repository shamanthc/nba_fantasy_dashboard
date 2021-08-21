#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# shiny::runApp("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/Fantasy-Dashboard")

library(shiny)
library(dplyr)
source( paste(getwd(), "/NBA-statistic-predictions.R", sep=""))
player_choices = readLines(paste(getwd(), "/playerlist.txt", sep=""), encoding = 'UTF-8')
options(width = 210)

ui <- fluidPage(
    titlePanel(h1("Fantasy Dashboard")),
    
    fluidRow(
        column(width = 2,
         selectInput("playername",
                     label = "Choose a player",
                     choices = player_choices,
                     selected = NULL),
        ),

    ),
    
    fluidRow(
        column(width = 2, numericInput(inputId = "mins", label = "Minutes:", 0, min = 0, max = 48, value = 30)
        ),
    ),
    
    fluidRow(
        h3("Predicted Stats Per Game"),
        column(width = 2, h4("Points"), verbatimTextOutput("pred_pts")
        ),
        column(width = 2, h4("Rebounds"), verbatimTextOutput("pred_rbs")
        ),
        column(width = 2, h4("Assists"), verbatimTextOutput("pred_asts")
        ),
        column(width = 2, h4("Steals"), verbatimTextOutput("pred_stls")
        ),
        column(width = 2, h4("Blocks"), verbatimTextOutput("pred_blks")
        ),
        column(width = 2, h4("Turnovers"), verbatimTextOutput("pred_tov")
        ),
        column(width = 2, h4("3PM"), verbatimTextOutput("pred_3pm")
        ),
        column(width = 2, h4("FGM"), verbatimTextOutput("pred_fgm")
        ),
        column(width = 2, h4("FGA"), verbatimTextOutput("pred_fga")
        ),
        column(width = 2, h4("FG%"), verbatimTextOutput("pred_fgper")
        ),
        column(width = 2, h4("FTM"), verbatimTextOutput("pred_ftm")
        ),
        column(width = 2, h4("FTA"), verbatimTextOutput("pred_fta")
        ),
        column(width = 2, h4("FT%"), verbatimTextOutput("pred_ftper")
        ),
    ),
    
    

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$pred_pts <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_pts(playername))
        
    })
    output$pred_rbs <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_rbs(playername))
        
    })
    output$pred_asts <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_asts(playername))
        
    })
    output$pred_stls <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_stls(playername))
        
    })
    output$pred_blks <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_blks(playername))
        
    })
    output$pred_tov <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_blks(playername))
        
    })
    output$pred_3pm <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_3pm(playername))
        
    })
    output$pred_fgm <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_fgm(playername))
        
    })
    
    output$pred_fga <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_fga(playername))
        
    })
    output$pred_fgper <- renderPrint({
        playername <- sub(' ', '', input$playername)
        round(predict_fgper(playername), digits = 2)
        
    })
    output$pred_ftm <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_ftm(playername))
        
    })
    output$pred_fta <- renderPrint({
        playername <- sub(' ', '', input$playername)
        ceiling(predict_fta(playername))
        
    })
    output$pred_ftper <- renderPrint({
        playername <- sub(' ', '', input$playername)
        round(predict_ftper(playername), digits = 2)
        
    })
    

}

# Run the application 
shinyApp(ui = ui, server = server)
