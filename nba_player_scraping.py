# -*- coding: UTF-8 -*-
import pandas as pd
import re
import requests
from bs4 import BeautifulSoup
import os
import shutil

#selenium imports 
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException

# some defaults to scrape data from Basketball reference. Scrapes data from the YEAR-1 - YEAR season e.g. to scrape data from the 2018 - 2019 season, set YEAR to 2019 
YEAR = 2021
playersMap = {}
main_url = 'https://www.basketball-reference.com'
url = "https://www.basketball-reference.com/leagues/NBA_" + str(YEAR) + "_per_game.html"
file_location = os.getcwd() + "\\Fantasy-Dashboard\\Player Data\\"
file_location2 = os.getcwd() + "\\Fantasy-Dashboard"
#file_location2 = "C:/Users/Home/Documents/"
#if os.path.exists(file_location):
    #shutil.rmtree(file_location)
#os.mkdir(file_location)

# a map to replace special characters because there will be some read issues since R and the filesystem interpret special characters differently
special_char_map = {'À':'A', 'Á':'A', 'Â':'A', 'Ã':'A', 'Ä':'A', 'Å':'A', 'Æ':'A', 'Ç':'C', 'È':'E', 'É':'E','Ê':'E', 'Ë':'E', 'Ì':'I', 'Í':'I', 'Î':'I', 'Ï':'I', 'İ':'I', 'Ñ':'N', 'Ò':'O', 
                    'Ó':'O', 'Ô':'O', 'Õ':'O', 'Ö':'O', 'Ø':'O', 'Š':'S','Ù':'U','Ú':'U', 'Û':'U', 'Ü':'U', 'Ý':'Y','Ž':'Z', 'à':'a', 'á':'a', 'â':'a', 'ã':'a', 'ä':'a', 'å':'a', 'æ':'a', 
                    'ā':'a', 'ç':'c', 'ć':'c', 'č':'c','è':'e', 'é':'e', 'ê':'e', 'ë':'e', 'ì':'i', 'í':'i', 'î':'i', 'ï':'i', 'ð':'o', 'ñ':'n', 'ò':'o', 'ó':'o', 'ô':'o', 'õ':'o','ö':'o', 
                    'ø':'o', 'š':'s','ù':'u', 'ú':'u', 'û':'u','ū':'u','ý':'y', 'ý':'y', 'ÿ':'y','ž':'z'}
special_chars = special_char_map.keys()


## this is selenium code
#driver = webdriver.Chrome(executable_path="H:\Backup\Documents\Shamanth's Folder\Fantasy Dashboard\chromedriver_win32\chromedriver")
#driver.get(url)


# get access to the page
page = requests.get(url)
soup = BeautifulSoup(page.text, 'html.parser')

# get a list of the players
tableBody = soup.find('tbody')
players = tableBody.find_all('tr', class_="full_table")
num_of_players = len(players)

# create a map that maps each player to their respective html page
for p in players:    
    plink = p.find('a')
    link = plink['href']
    name = plink.get_text()
    for c in special_chars:
        if name.find(c) != -1:
            name = name.replace(c, special_char_map[c])
    playersMap[name] = link[0:-5]   
print("Finished creating players map")
print(playersMap)
list_of_players = playersMap.keys()
with open(file_location2 + "playerlist.txt", 'w', encoding='utf-8') as f:
    for p in list_of_players:
        text = p + "\n"
        f.write(text.encode('utf8').decode('utf-8')) 
f.close()
    

# for each player scrape their individual statistics for each game they have played that season
for p in playersMap:
    # get access to the player's gamelog and advanced stats gamelog   
    url = 'https://www.basketball-reference.com' + playersMap[p] + '/gamelog/' + str(YEAR)
    urladv = 'https://www.basketball-reference.com' + playersMap[p] + '/gamelog-advanced/' + str(YEAR)
    page = requests.get(url)
    page2 = requests.get(urladv)
    soup = BeautifulSoup(page.text, 'html.parser')
    soup2 = BeautifulSoup(page2.text, 'html.parser')
    
    # get the column names of the table
    header = soup.find('thead')
    header2 = soup2.find('thead')
    columns = [col.get_text() for col in header.find_all('th')]
    columns2 = [col.get_text() for col in header2.find_all('th')]
    # deleting miscellaneous/reptitive columns
    del columns[0]
    for i in range(10):
        del columns2[0]
    # creating the columns for the final data frame
    final_cols = columns + columns2
    final_df = pd.DataFrame(columns=final_cols)
    
    # get the player's stats for each game
    tableBody = soup.find('tbody')
    tableBody2 = soup2.find('tbody')
    games = tableBody.find_all('tr', attrs={'id':re.compile('pgl')})
    adv_games = tableBody2.find_all('tr', attrs={'id':re.compile('pgl')})
    for g in games:
        stats = [stat.get_text() for stat in g.find_all('td')]
        mins = str(int(round(float(stats[8].replace(":",".")))))
        stats[8] = mins
        game = adv_games[games.index(g)]
        adv_stats = game.find_all('td')
        # get the player's advanced stats for that game
        for i in range(9, len(adv_stats)):
            adv_stat = adv_stats[i]
            stats.append(adv_stat.get_text())
        temp_df = pd.DataFrame(stats).transpose()
        temp_df.columns = final_cols
        # join the player's stats with the final dataframe
        final_df = pd.concat([final_df, temp_df], ignore_index=True)
    
    # create a csv file and write the dataframe to the csv file
    filename = p.replace(" ", "") + ".csv"
    final_df.to_csv(file_location + filename , index=False, sep=',', encoding='utf-8')
    print("Finished creating file for " + p)