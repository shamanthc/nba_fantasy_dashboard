# This R script contains functions that are used in the dashboard

filelocation <- "H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/NBA Players/"
filelocation2 <- "H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/Team Data/"
file_model <- "H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/playerdataclean.csv"
library(dplyr)
library(rvest)


get_avgmins <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  avg_mins <- mean(player_data[,9])
  return(avg_mins)
}

get_avgfgm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,10]))
}

get_avgfga <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,11]))
}

get_avgftm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,16]))
}

get_avgfta <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,17]))
}

get_avgthreepm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  avg_mins <- mean(player_data[,13])
  return(avg_mins)
}

get_avgusgr <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,39]))
}

get_avgtov <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(mean(player_data[,25]))
}

getGamelog <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  return(player_data)
}

get_team_name <- function(playername) {
  filename <- paste(filelocation, playername, sep="")
  player_data <- read.csv(filename, header=1)
  team_name <- tail(player_data)[1,4]
  return(team_name)
}

get_team_mp <- function(team_name) {
  team_file <- paste(team_name, ".csv", sep="")
  filename <- paste(filelocation2, team_file, sep="")
  team_data <- read.csv(filename, header=1)[,3:24]
  mp <- as.numeric(as.character(team_data[2,1]))
  return(mp)
}

get_team_fga <- function(team_name) {
  team_file <- paste(team_name, ".csv", sep="")
  filename <- paste(filelocation2, team_file, sep="")
  team_data <- read.csv(filename, header=1)[,3:24]
  fga <- as.numeric(as.character(team_data[2,3]))
  return(fga)
}

get_team_fta <- function(team_name) {
  team_file <- paste(team_name, ".csv", sep="")
  filename <- paste(filelocation2, team_file, sep="")
  team_data <- read.csv(filename, header=1)[,3:24]
  fta <- as.numeric(as.character(team_data[2,12]))
  return(fta)
}

get_team_tov <- function(team_name) {
  team_file <- paste(team_name, ".csv", sep="")
  filename <- paste(filelocation2, team_file, sep="")
  team_data <- read.csv(filename, header=1)[,3:24]
  tov <- as.numeric(as.character(team_data[2,20]))
  return(tov)
}

cal_usgr <- function(fga, fta, tov, mp, tmp, tfga, tfta, ttov) {
  
  new_usgr <- 100 * ((fga + 0.44 * fta + tov) * (tmp / 5)) / (mp * (tfga + 0.44 * tfta + ttov))
  # new_usgr <- 100 * ((fga + 0.44 * fta + tov) * (tmp / 5)) / (mp * (tfga + 0.44 * tfta + ttov))
  return(new_usgr)
}

cal_tsp <- function() {
  
}

cal_efg <- function(fg, threepm, fga) {
  efg <- (fg + 0.5 * threepm)/fga
  return(efg)
}

# plotting data
regression_model_pts1 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- fit1 <- lm(pts~mins+usgr+fgm+ftm)
  return(fit)
}

regression_model_pts2 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+fga+fta)
  return(fit)
}

regression_model_pts3 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+tsp+usgr)
  return(fit)
}

regression_model_pts4 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+usgr+fgp+ftp)
  return(fit)
}

regression_model_pts5 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+fgm+fga+ftm+fta+efg)
  return(fit)
}

regression_model_pts6 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+fgm+fga+ftm+fta+tsp)
  return(fit)
}

regression_model_pts7 <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  pts <- player_data[,27]
  mins <- player_data[,9]
  fgm <- player_data[,10]
  fga <- player_data[,11]
  fgp <- player_data[,12]
  ftm <- player_data[,16]
  fta <- player_data[,17]
  ftp <- player_data[,18]
  usgr <- player_data[,39]
  tsp <- player_data[,30]
  efg <- player_data[,31]
  fit <- lm(pts~mins+fgm+fga+fta+ftm+usgr)
  return(fit)
}

regression_model_rbs <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  mins <- player_data[,9]
  rbs <- player_data[,21]
  fit <- lm(rbs~0+mins)
  rbshat <- predict.lm(fit)
  plot(mins, rbs)
  lines(mins, rbshat)
  return(fit)
}

regression_model_asts <- function(player_file) {
  filename <- paste(filelocation, player_file, sep="")
  player_data <- read.csv(filename, header=1)
  mins <- player_data[,9]
  asts <- player_data[,22]
  fit <- lm(asts~0+mins)
  astshat <- predict.lm(fit)
  plot(mins, asts)
  lines(mins, astshat)
  return(fit)
}

predict_stat_model1 <- function(fit, minutes, usagerate, fgmade, ftmade ) {
  x0 <- data.frame(mins=minutes, usgr=usagerate, fgm=fgmade, ftm=ftmade)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

predict_stat_model2 <- function(fit, minutes, fgattempt, ftattempt ) {
  x2 <- data.frame(mins=minutes, fga=fgattempt, fta=ftattempt)
  pts2 <- predict(fit, x2, interval="confidence", level = 0.95)
  return(pts2)
  # x0 <- data.frame(mins=minutes, fga=fgattempt, fta=ftattempt)
  # result <- predict(fit, x0, interval="confidence", level = 0.95)
  # return(result)
}

predict_stat_model3 <- function(fit, minutes, tsper, usgrate ) {
  x0 <- data.frame(mins=minutes, tsp=tsper, usgr=usgrate)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

predict_stat_model4 <- function(fit, minutes, usgrate, fgper, ftper) {
  x0 <- data.frame(mins=minutes, usgr= usgrate, fgp=fgper, ftp=ftper)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

predict_stat_model5 <- function(fit, minutes, fgmade, fgattempt, ftmade, ftattempt, efgr) {
  x0 <- data.frame(mins=minutes, fgm=fgmade, fga=fgattempt, ftm=ftmade, fta=ftattempt, efg=efgr)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

predict_stat_model6 <- function(fit, minutes, fgmade, fgattempt, ftmade, ftattempt, tsper) {
  x0 <- data.frame(mins=minutes, fgm=fgmade, fga=fgattempt, ftm=ftmade, fta=ftattempt, tsp=tsper)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

predict_stat_model7 <- function(fit, minutes, fgmade, fgattempt, ftmade, ftattempt, usgrate) {
  x0 <- data.frame(mins=minutes, fgm=fgmade, fga=fgattempt, ftm=ftmade, fta=ftattempt, usgr=usgrate)
  result <- predict(fit, x0, interval="confidence", level = 0.95)
  return(result)
}

