# nba_fantasy_dashboard

Welcome! This is a dashboard that you can use to predict the statistics of an NBA player.
This README file will explain how to run the scripts/dashboard on your computer. Check the
README file for updates as well. This is a personal project of mine and I will be improving it
from time to time. 

The predictions are based on a linear regression model. Currently the dashboard can predict
how many POINTS a player will score on average. I am still working on the models to predict REBOUNDS
and ASSISTS.

To run the dashboard on your computer you will a device that can execute Python scripts and you will need to have R Shiny installed. 
First clone the repository to your computer.
Next you will need to run the following Python scripts that will generate .csv and .txt files that contain the data:
- nba_league_scraping.py: extracts a player's averages for the specified season (1 csv file, 1 txt file)
- nba_player_scraping.py: extracts a player's gamelog i.e. the player's stats for each game (approx 500 csv files, dependant on how many players played that season)
- nba_team_scraping.py:   extracts a team's season averages (30 csv files b/c there are 30 teams)

For each script, you will need to edit two global variables: YEAR and file_location
YEAR is the season you would like to extract data from. If you would like to extract data from the
2018-2019 season, you will set YEAR to 2019. If you would like to extract data from the 2019-2020 season
you will set YEAR to 2020. file_location is simply the file path of where you would like the files to be stored. 
The csv file names will be determined by the scripts so you do not need to specify those. Simply specify the file path of the folder you would like the csv files to
be stored in.
For the script nba_player_scraping
NOTE: I will be working to improve the scripts so users won't need to edit file paths
NOTE: nba_player_scraping will take some time to complete since there are approx. 500 players in the league. I am looking into how to improve the speed for this.  

If you would like to update the data, simply re-run these scripts. Keep in mind that by updating, you may overwrite these files.

After you have executed the Python scripts, you will have all the data needed. Next you will need to execute the R scripts. 
You will need the following R scripts to run the dashboard:
- app.R: the R script that will execute the dashboard found in the folder called "Fantasy-Dashboard"
- NBA-regression-script.R: contains functions that will make the predictions and perform other dashboard operations


The R script to run the dashboard is found in the Fantasy-Dashboard folder and is called app.R. Open this file. Once again you will need to edit two file paths. 
- line 14: This is the file path to the file NBA-regression-script.R. Include the file name in the file path. This is to import the functions needed to perform the dashboard operations. 
- line 15: This is the file path to the .txt file created by the Python script nba_league_scraping.py. Include the file name of the .txt file in the file path. This is needed to generate the options
  for the drop-down list in the dashboard. 

You will also need to edit two file paths in the file NBA-regression-script.R
- line 2: This is the file path to the folder where you stored the csv files created by nba_player_scraping.py
- line 3: This is the file path to the folder where you stored the csv files created by nba_team_scraping.py

To execute the dashboard run the following command: shiny::runApp("[path to app.R]")
Replace [path to app.R] with the file path to the file app.R. Do not include app.R in the file path.
ex. shiny::runApp("some/path/to/folder/that/has/the/file/")
NOTE: R uses forward slashes "/" in their file paths. 
NOTE: I will be working to improve this so it is abstracted and users won't need to update the file paths

Once you run the command above, a new window will appear with the dashboard. Enter in the values to predict the number of points that a player will average. 


