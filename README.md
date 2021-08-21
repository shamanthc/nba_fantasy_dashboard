# nba_fantasy_dashboard

Welcome! This is a dashboard that you can use to predict the statistics of an NBA player.
This README file will explain how to run the scripts/dashboard on your computer. Check the
README file for updates as well. This is a personal project of mine and I will be improving it
from time to time. 

The predictions are based on a linear regression model. Currently the dashboard can predict the following per game
statistics:
- Points
- Rebounds
- Assists
- Steals
- Blocks
- Turnovers
- Field Goals Made
- Field Goals Attempted
- Field Goal Percentage
- Free Throws Made
- Free Throws Attempted
- Free Throw Percentage

To run the dashboard on your computer you will a device that can execute Python scripts and you will need to have R Shiny installed. 
First clone the repository to your computer.
Next you will need to run the following Python scripts that will generate .csv and .txt files that contain the data:
- nba_player_scraping.py: extracts a player's gamelog i.e. the player's stats for each game (approx 500 csv files, dependant on how many players played that season)

For each script, you will need to edit the following global variable: YEAR
YEAR is the season you would like to extract data from. If you would like to extract data from the
2018-2019 season, you will set YEAR to 2019. If you would like to extract data from the 2019-2020 season
you will set YEAR to 2020. 
NOTE: I will be working to improve the scripts to abstract their details so users won't have to edit any variables inside them. 
NOTE: nba_player_scraping will take some time to complete since there are approx. 500 players in the league. I am looking into how to improve the speed for this.  

If you would like to update the data, simply re-run these scripts. Keep in mind that by updating, you will overwrite these files.

After you have executed the Python scripts, you will have all the data needed. Next you will need to execute the R scripts. 
You will need the following R scripts to run the dashboard:
- app.R: the R script that will execute the dashboard found in the folder called "Fantasy-Dashboard"
- NBA-statistic-predictions.R: contains functions that will make the predictions and perform other dashboard operations


The R script to run the dashboard is found in the Fantasy-Dashboard folder and is called app.R. Open this file.
Simply execute the app to open the dashboard.

To execute the dashboard run the following command: shiny::runApp("[path to app.R]")
Replace [path to app.R] with the file path to the file app.R. Do not include app.R in the file path.
ex. shiny::runApp("some/path/to/folder/that/has/the/file/")
NOTE: R uses forward slashes "/" in their file paths.

Once you run the command above, a new window will appear with the dashboard and the predicted stats of an NBA player will appear.
To view the predicted stats of the other players, simply select a new player from the drop-down menu. 

NOTE: I am trying to make this dashboard more interactive. The goal is to allow the user to change parameters such as minutes so they can 
change the conditions and see the statistics based on those conditions. 


