# -*- coding: UTF-8 -*-
import pandas as pd
import re
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
      
# some defaults to scrape data from Basketball reference. Scrapes data from the YEAR-1 - YEAR season e.g. to scrape data from the 2018 - 2019 season, set YEAR to 2019 
YEAR = 2019
playersMap = {}
file_location = "H:\Backup\Documents\Shamanth's Folder\Fantasy Dashboard\playerdata.csv"
i = 1

# a map to replace special characters because there will be some read issues since R and the filesystem interpret special characters differently
special_char_map = {'À':'A', 'Á':'A', 'Â':'A', 'Ã':'A', 'Ä':'A', 'Å':'A', 'Æ':'A', 'Ç':'C', 'È':'E', 'É':'E','Ê':'E', 'Ë':'E', 'Ì':'I', 'Í':'I', 'Î':'I', 'Ï':'I', 'Ñ':'N', 'Ò':'O', 'Ó':'O', 
                    'Ô':'O', 'Õ':'O', 'Ö':'O', 'Ø':'O', 'Š':'S','Ù':'U','Ú':'U', 'Û':'U', 'Ü':'U', 'Ý':'Y','Ž':'Z', 'à':'a', 'á':'a', 'â':'a', 'ã':'a', 'ä':'a', 'å':'a', 'æ':'a', 
                    'ā':'a', 'ç':'c', 'ć':'c', 'č':'c','è':'e', 'é':'e', 'ê':'e', 'ë':'e', 'ì':'i', 'í':'i', 'î':'i', 'ï':'i', 'ð':'o', 'ñ':'n', 'ò':'o', 'ó':'o', 'ô':'o', 'õ':'o','ö':'o', 
                    'ø':'o', 'š':'s','ù':'u', 'ú':'u', 'û':'u','ū':'u','ý':'y', 'ý':'y', 'ÿ':'y','ž':'z'}
special_chars = special_char_map.keys()
list_of_players = []

# get access to the page   
url = "https://www.basketball-reference.com/leagues/NBA_" + str(YEAR) + "_per_game.html"
urladv = "https://www.basketball-reference.com/leagues/NBA_" + str(YEAR) + "_advanced.html"
page = requests.get(url)
page2 = requests.get(urladv)
soup = BeautifulSoup(page.text, 'html.parser')
soup2 = BeautifulSoup(page2.text, 'html.parser')

# get the column headers
header = soup.find('thead')
header2 = soup2.find('thead')
columns = [col.get_text() for col in header.find_all('th')]
del columns[0]
columns2 = [col.get_text() for col in header2.find_all('th')]
for i in range(7):
    del columns2[0]
final_cols = columns + columns2
# create the final data frame
final_df = pd.DataFrame(columns=final_cols)

# for each player get their season averages for the YEAR-1 - YEAR season
tableBody = soup.find('tbody')
tableBody2 = soup2.find('tbody')
players = tableBody.find_all('tr', class_="full_table")
adv_players = tableBody2.find_all('tr', class_="full_table")
for p in players: 
    stats = [stat.get_text() for stat in p.find_all('td')]
    mins = str(int(round(float(stats[6]))))
    stats[6] = mins    
    
    # the player's advanced stats
    player = adv_players[players.index(p)]
    adv_stats = player.find_all('td')
    for i in range(6, len(adv_stats)):
        adv_stat = adv_stats[i]
        stats.append(adv_stat.get_text())   
        
    # edit the player's name
    name = stats[0]
    for c in special_chars:
        if name.find(c) != -1:
            name = name.replace(c, special_char_map[c])
    stats[0] = name

    temp_df = pd.DataFrame(stats).transpose()
    temp_df.columns = final_cols
    # join the single player's stats with the overall dataset
    final_df = pd.concat([final_df, temp_df], ignore_index=True) 
    list_of_players.append(stats[0])
    print(stats[0] + " added")
    
# write the final dataframe to a csv file
final_df.to_csv(file_location, index=False, sep=',', encoding='utf-8')   
print("data frame done")

# create a txt file with a list of players
with open('playerlist.txt', 'w', encoding='utf-8') as f:
    for p in list_of_players:
        text = p + "\n"
        f.write(text.encode('utf8').decode('utf-8')) 
f.close()