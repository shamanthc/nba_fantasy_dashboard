import pandas as pd
import re
import requests
from bs4 import BeautifulSoup, Comment
from selenium import webdriver



# some defaults to scrape data from Basketball reference. Scrapes data from the YEAR-1 - YEAR season e.g. to scrape data from the 2018 - 2019 season, set YEAR to 2019 
YEAR = 2019
num_of_cols = 24
num_of_rows = 9
total_elements = num_of_cols * num_of_rows

# list of team abbreviations
teams = ['ATL', 'BOS', 'NJN', 'CHA', 'CHI', 'CLE', 'DAL', 'DEN', 'DET', 'GSW', 'HOU', 'IND', 'LAC', 'LAL', 'MEM', 'MIA', 'MIL', 'MIN', 'NOH', 'NYK', 'OKC', 'ORL',
              'PHI', 'PHO', 'POR', 'SAC', 'SAS', 'TOR', 'UTA', 'WAS']

# for each team scrape their season averages
for t in teams:
    
    # access the webpage
    url = "https://www.basketball-reference.com/teams/" + t + "/"+ str(YEAR) + ".html"
    res = requests.get(url,headers={"User-Agent":"Mozilla/5.0"})
    soup = BeautifulSoup(res.text, 'lxml')
    
    # get the header names
    for comment in soup.find_all(string=lambda text:isinstance(text,Comment)):
        data = BeautifulSoup(comment,"lxml")
        for items in data.select("table#team_and_opponent"):
            tds = [item.get_text(strip=True) for item in items.select("th,td")]
    
    final_cols = []
    # add the header names to the columns of the data frame
    for i in range(0, num_of_cols):
        final_cols.append(tds[i])
    i+=1
    # creatinga final dataframe
    final_df = pd.DataFrame(columns=final_cols)
    
    # scrape the value in position (i,j) of the table   
    while i < total_elements:
        stats = []
        for j in range(0, num_of_cols):
            stats.append(tds[i])
            i+=1
        temp_df = pd.DataFrame(stats).transpose()
        temp_df.columns = final_cols
        # add to the dataframe
        final_df = pd.concat([final_df, temp_df], ignore_index=True)
    
    # create a csv file for the team and write the data frame to the csv file
    filename = t + ".csv"
    final_df.to_csv(r"H:\Backup\Documents\Shamanth's Folder\Fantasy Dashboard\Team Data\\" + filename , index=False, sep=',', encoding='utf-8')
    print("Finished creating file for " + t)