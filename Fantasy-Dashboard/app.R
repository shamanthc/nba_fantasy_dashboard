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
source("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/NBA-regression-script.R")
player_choices = readLines("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/playerlist.txt", encoding = 'UTF-8')
options(width = 210)

ui <- fluidPage(
    titlePanel(h1("Fantasy Dashboard")),
    
    fluidRow(
        column(width = 2,
         selectInput("playername",
                     label = "Choose a player",
                     choices = player_choices,
                     selected = NULL),
         numericInput(inputId = "mins",
                     label = "Minutes:",
                     0,
                     min = 0,
                     max = 48,
                     value = 30),
         
        ),

    ),
    
    fluidRow(
        column(width = 2, numericInput("fgm", "Field Goal Makes", 1, min=0)
        ),
        column(width = 2, numericInput("fga", "Field Goal Attempts", 1, min=0)
        ),
        column(width = 2, numericInput("ftm", "Free Throw Makes", 1, min=0)
        ),
        column(width = 2, numericInput("fta", "Free Throw Attempts", 1, min=0)
        )
    ),
    
    fluidRow(
        column(width = 4,
               h3("Points"),
               verbatimTextOutput("pred_pts")
               # verbatimTextOutput("avgmins"),
               # verbatimTextOutput("avgusgr"),
               # verbatimTextOutput("avgfgm"),
               # verbatimTextOutput("avgftm")

        )
        # column(width = 4,
        #        h3("Rebounds"),
        #        verbatimTextOutput("pred_rbs")
        # ),
        # column(width = 4,
        #        h3("Assists"),
        #        verbatimTextOutput("pred_asts")
        # ),


    )
    
    # fluidRow(
    #     column(width = 12,
    #            verbatimTextOutput("gamelog")
    #     )
    # 
    #     
    #     
    # )
    
    
    # sidebarLayout(
    #     sidebarPanel(h2("Player Name Goes Here"),
    #                  selectInput("playername",
    #                              label = "Choose a player",
    #                              choices = player_choices,
    #                              selected = NULL),
    #                  
    #                  sliderInput(inputId = "mins",
    #                              label = "Minutes:",
    #                              min = 0,
    #                              max = 48,
    #                              value = 30)
    #                  
    #     ),
    #    
    #     
    #     
    #     mainPanel(
    #         #plotOutput("graph_pts"),
    # 
    #        h3("Points"),
    #        verbatimTextOutput("pred_pts"),
    # 
    # 
    # 
    #        h3("Rebounds"),
    #        verbatimTextOutput("pred_rbs"),
    # 
    # 
    # 
    #        h3("Assists"),
    #        verbatimTextOutput("pred_asts")
    # 
    # 
    #     ),
    #     
    # )
    # uiOutput("selectname"),
    # textOutput("result")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$gamelog <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        dataset <- getGamelog(player_file)
        dataset[order(dataset$G, decreasing = TRUE),]
    })

    output$avgmins <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        mins <- get_avgmins(player_file)
        mins
    })
    
    output$avgusgr <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        usgr <- get_avgusgr(player_file)
        usgr
    })
    
    output$avgfgm <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        fgm <- get_avgfgm(player_file)
        fgm
    })
    
    output$avgftm <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        ftm <- get_avgftm(player_file)
        ftm
    })
    
    output$pred_pts <- renderPrint({
        player <- sub(' ', '', input$playername)
        player <- sub(' ', '', player)
        player_file <- paste(player, ".csv", sep="")
        fit1 <- regression_model_pts1(player_file)
        fit2 <- regression_model_pts2(player_file)
        # fit3 <- regression_model_pts3(player_file)
        fit4 <- regression_model_pts4(player_file)
        fit5 <- regression_model_pts5(player_file)
        # fit6 <- regression_model_pts6(player_file)
        fit7 <- regression_model_pts7(player_file)
        
        team_name <- get_team_name(player_file)
        tmp <- get_team_mp(team_name)
        tfga <- get_team_fga(team_name)
        tfta <- get_team_fta(team_name)
        ttov <- get_team_tov(team_name)
        
        usgr <- cal_usgr(input$fga, input$fta, get_avgtov(player_file), input$mins, tmp, tfga, tfta, ttov)
        efg <- cal_efg(input$fgm, get_avgthreepm(player_file), input$fga)
        
        
        pred1 <- predict_stat_model1(fit1, input$mins, usgr, input$fgm, input$ftm)
        pred2 <- predict_stat_model2(fit2, input$mins, input$fga, input$fta)
        pred4 <- predict_stat_model4(fit4, input$mins, usgr, (input$fgm/input$fga), (input$ftm/input$fta))
        pred5 <- predict_stat_model5(fit5, input$mins, input$fgm, input$fga, input$ftm, input$fta, efg)
        pred7 <- predict_stat_model7(fit7, input$mins, input$fgm, input$fga, input$ftm, input$fta, usgr)

        vec <- c(pred1[1,1],pred2[1,1],pred4[1,1],pred5[1,1],pred7[1,1])
        mean(vec)
        
    })
    
    output$pred_rbs <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        fit <- regression_model_rbs(player_file)
        pred <- predict_stat(fit, input$mins)
        pred 
    })
    
    output$pred_asts <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        fit <- regression_model_asts(player_file)
        pred <- predict_stat(fit, input$mins)
        pred
    })
    
    
    # plots of the regression models
    # output$graph_pts <- renderPlot({
    #     player <- sub(' ', '', input$playername)
    #     player_file <- paste(player, ".csv", sep="")
    #     regression_model_pts(player_file)
    # })
    
    # output$graph_rbs <- renderPlot({
    #     player <- sub(' ', '', input$playername)
    #     player_file <- paste(player, ".csv", sep="")
    #     regression_model_rbs(player_file)
    # })
    
    # output$graph_asts <- renderPlot({
    #     player <- sub(' ', '', input$playername)
    #     player_file <- paste(player, ".csv", sep="")
    #     regression_model_rbs(player_file)
    # })
    
    # summary's of the regression models
    # output$summary1 <- renderPrint({
    #     player <- sub(' ', '', input$playername)
    #     player_file <- paste(player, ".csv", sep="")
    #     fit <- regression_model_pts(player_file)
    #     summary(fit)
    # })
    
    output$summary2 <- renderPrint({
        player <- sub(' ', '', input$playername)
        player_file <- paste(player, ".csv", sep="")
        fit <- regression_model_pts2(player_file)
        summary(fit)
    })
    
    # output$summary3 <- renderPrint({
    #     player <- sub(' ', '', input$playername)
    #     player_file <- paste(player, ".csv", sep="")
    #     fit <- regression_model_pts(player_file)
    #     summary(fit)
    # })
}

# Run the application 
shinyApp(ui = ui, server = server)
