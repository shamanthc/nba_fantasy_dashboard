# This R script contains functions that are used in the dashboard

filelocation <- paste(getwd(), "/Player Data/", sep="") # "H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/Player Data/"
filelocation2 <- "H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/Team Data/"
library(dplyr)
library(rvest)

# minutes and average minutes
get_mins <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,9])
}

get_avgmins <- function(playername) {
  return(mean(get_mins(playername)))
  
}

#fgm and avgfma
get_fgm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,10])
}

get_avgfgm <- function(playername) {
  return(mean(get_fgm(playername)))
}

# fga and avgfga
get_fga <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,11])
}

get_avgfga <- function(playername) {
  return(mean(get_fga(playername)))
}

# fgp and avgfgp
get_fgp <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,12])
}

get_avgfgp <- function(playername) {
  return(mean(get_fgp(playername)))
}

# threepm and avgthreepm
get_threepm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,13])
}

get_avgthreepm <- function(playername) {
  return(mean(get_threepm(playername)))
}

# get threepa and avgthreepa
get_threepa <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,14])
}

get_avgthreepa <- function(playername) {
  return(mean(get_threepa(playername)))
}

# threepper and avgthreepper
get_threepper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,15])
}

get_avgthreepper <- function(playername) {
  return(mean(get_threepper(playername)))
}

# twopm and avgtwopm
get_twopm <- function(playername) {
  return(get_fgm(playername) - get_threepm(playername))
}

get_avgtwopm <- function(playername) {
  return(mean(get_twopm(playername)))
}

# twopa and avgtwopa
get_twopa <- function(playername) {
  return(get_fga(playername) - get_threepa(playername))
}

get_avgtwopa <- function(playername) {
  return(mean(get_twopa(playername)))
}

# twopper and avgtwopper
get_twopper <- function(playername) {
  return(get_twopm(playername) / get_twopa(playername))
}

get_avgtwopper <- function(playername) {
  return(mean(get_twopper(playername)))
}

# efg and avgefg
get_efg <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,31])
}

get_avgefg <- function(playername) {
  return(mean(get_efg(playername)))
}

# ftm and avgftm
get_ftm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,16])
}

get_avgftm <- function(playername) {
  return(mean(get_ftm(playername)))
}

# fta and avgfta
get_fta <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,17])
}

get_avgfta <- function(playername) {
  return(mean(get_fta(playername)))
}

# ftper and avgftper
get_ftper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,18])
}

get_avgftper <- function(playername) {
  return(mean(get_ftper(playername)))
}

# orb and avgorb
get_orb <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,19])
}

get_avgorb <- function(playername) {
  return(mean(get_orb(playername)))
}

# drb and avgdrb
get_drb <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,20])
}

get_avgdrb <- function(playername) {
  return(mean(get_drb(playername)))
}

# trb and avgtrb
get_trb <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,21])
}

get_avgtrb <- function(playername) {
  return(mean(get_trb(playername)))
}

# asts and avgasts
get_ast <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,22])
}

get_avgast <- function(playername) {
  return(mean(get_ast(playername)))
}

# stl and avgstl
get_stl <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,23])
}

get_avgstl <- function(playername) {
  return(mean(get_stl(playername)))
}

# blk and avgblk
get_blk <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,24])
}

get_avgblk <- function(playername) {
  return(mean(get_blk(playername)))
}

# tov and avgtov
get_tov <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,25])
}

get_avgtov <- function(playername) {
  return(mean(get_tov(playername)))
}

# pf and avgpf
get_pf <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,26])
}

get_avgpf <- function(playername) {
  return(mean(get_pf(playername)))
}

# pts and avgpts
get_pts <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,27])
}

get_avgpts <- function(playername) {
  return(mean(get_pts(playername)))
}

# tsper and avgtsper
get_tsper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,30])
}

get_avgtsper <- function(playername) {
  return(mean(get_tsper(playername)))
}

# threepar and avgthreepar
get_threepar <- function(playername) {
  return(get_threepa(playername)/get_fga(playername))
}

get_avgthreepar <- function(playername) {
  return(mean(get_threepar(playername)))
}

# orbper and avgorbper
get_orbper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,32])
}

get_avgorbper <- function(playername) {
  return(mean(get_orbper(playername)))
}

# drbper and avgdrbper
get_drbper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,33])
}

get_avgdrbper <- function(playername) {
  return(mean(get_drbper(playername)))
}

# trbper and avgtrbper
get_trbper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,34])
}

get_avgtrbper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(mean(get_trbper(playername)))
}

# astper and avgastper
get_astper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,35])
}

get_avgastper <- function(playername) {
  return(mean(get_astper(playername)))
}

# stlper and avgstlper
get_stlper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,36])
}

get_avgstlper <- function(playername) {
  return(mean(get_stlper(playername)))
}

# blksper and avgblksper
get_blkper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,37])
}

get_avgblkper <- function(playername) {
  return(mean(get_blksper(playername)))
}

# tovper and avgtovper
get_tovper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,38])
}

get_avgtovper <- function(playername) {
  data = get_tovper(playername)
  return(mean(get_tovper(playername)))
}

# usgper and avgusgper
get_usgper <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="")
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,39])
}

get_avgusgper <- function(playername) {
  return(mean(get_usgper(playername)))
}

# bpm and avgbpm
get_bpm <- function(playername) {
  filename <- paste(filelocation, playername, sep = "")
  filename <- paste(filename, ".csv", sep="") 
  player_data <- read.csv(filename, header=1, fileEncoding = 'UTF-8')
  player_data[is.na(player_data)] <- 0
  return(player_data[,43])
}

get_avgbpm <- function(playername) {
  return(mean(get_bpm(playername)))
}

predict_pts <- function(playername) {
  pts = get_pts(playername)
  mins = get_mins(playername)
  fgm = get_fgm(playername)
  fga = get_fga(playername)
  threepm = get_threepm(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  stl = get_stl(playername)
  astper = get_astper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)
  fit = lm(formula = pts ~ mins + fgm + fga + threepm + ftm + fta + stl + astper + tovper + usgper + bpm)
  x0 <- data.frame(mins=mean(mins), fgm=mean(fgm), fga=mean(fga), threepm=mean(threepm), ftm=mean(ftm), fta=mean(fta),
                   stl=mean(stl), astper=mean(astper), tovper=mean(tovper), usgper=mean(usgper), bpm = mean(bpm))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_rbs <- function(playername) {
  trb = get_trb(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  orb = get_orb(playername)
  drb = get_drb(playername)
  tov = get_tov(playername)
  pf = get_pf(playername)
  fit = lm(formula = trb ~ ftm + fta + orb + drb + tov + pf)
  x0 <- data.frame(ftm=mean(ftm), fta=mean(fta), orb=mean(orb), drb=mean(drb), tov=mean(tov), pf=mean(pf))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_asts <- function(playername) {
  ast = get_ast(playername)
  mins = get_mins(playername)
  threepa = get_threepa(playername)
  threepper = get_threepper(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  ftper = get_ftper(playername)
  orb = get_orb(playername)
  stl = get_stl(playername)
  blk = get_blk(playername)
  tov = get_tov(playername)
  pf = get_pf(playername)
  orbper = get_orbper(playername)
  drbper = get_drbper(playername)
  trbper = get_trbper(playername)
  astper = get_astper(playername)
  stlper = get_stlper(playername)
  blkper = get_blkper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)

  
  fit =   lm(formula = ast ~ mins + threepa + threepper + ftm + fta + ftper +
                    orb + stl + blk + tov + pf + orbper + drbper + trbper + astper +
                    stlper + blkper + tovper + usgper + bpm)
  x0 <- data.frame(mins=mean(mins), threepa=mean(threepa), threepper=mean(threepper), ftm=mean(ftm), fta=mean(fta),
                   ftper=mean(ftper), orb=mean(orb), stl=mean(stl), blk=mean(blk), tov=mean(tov), pf=mean(pf), orbper=mean(orbper),
                   drbper=mean(drbper), trbper=mean(trbper),  astper=mean(astper),
                   stlper=mean(stlper), blkper=mean(blkper), tovper=mean(tovper), usgper=mean(usgper), bpm=mean(bpm))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_stls <- function(playername) {
  stl = get_stl(playername)
  mins = get_mins(playername)
  fgm = get_fgm(playername)
  threepm = get_threepm(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  ftper = get_ftper(playername)
  orb = get_orb(playername)
  drb = get_drb(playername)
  ast = get_ast(playername)
  pf = get_pf(playername)
  pts = get_pts(playername)
  tsper = get_tsper(playername)
  orbper = get_orbper(playername)
  drbper = get_drbper(playername)
  trbper = get_trbper(playername)
  astper = get_astper(playername)
  stlper = get_stlper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)

  
  
  fit = lm(formula = stl ~ mins + fgm + threepm + ftm + ftper + orb +
                 drb + ast + pf + pts + tsper + orbper + drbper + trbper +
                 astper + stlper + tovper + usgper + bpm)
  x0 <- data.frame(mins=mean(mins), fgm=mean(fgm), threepm=mean(threepm), ftm=mean(ftm), ftper=mean(ftper),
                   orb=mean(orb), drb=mean(drb), ast=mean(ast), pf=mean(pf), pts=mean(pts),
                   tsper=mean(tsper), orbper=mean(orbper),
                   drbper=mean(drbper), trbper=mean(trbper), astper=mean(astper), stlper=mean(stlper), tovper=mean(tovper),
                   usgper=mean(usgper), bpm=mean(bpm))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_blks <- function(playername) {
  blk = get_blk(playername)
  mins = get_mins(playername)
  fga = get_fga(playername)
  threepper = get_threepper(playername)
  efg = get_efg(playername)
  orb = get_orb(playername)
  drb = get_drb(playername)
  ast = get_ast(playername)
  tov = get_tov(playername)
  pts = get_pts(playername)
  tsper = get_tsper(playername)
  drbper = get_drbper(playername)
  astper = get_astper(playername)
  stlper = get_stlper(playername)
  blkper = get_blkper(playername)
  bpm = get_bpm(playername)
  
  
  
  fit = lm(formula = blk ~ mins + fga + threepper + efg + orb + drb +
                 ast + tov + pts + tsper + drbper + astper + stlper + blkper +
                 bpm)
  x0 <- data.frame(mins=mean(mins), fga=mean(fga), threepper=mean(threepper), efg=mean(efg),
                   orb=mean(orb), drb=mean(drb), ast=mean(ast), tov=mean(tov), pts=mean(pts), tsper=mean(tsper),
                   drbper=mean(drbper), astper=mean(astper), stlper=mean(stlper), blkper=mean(blkper),
                   bpm=mean(bpm))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_tov <- function(playername) {
  tov = get_tov(playername)
  mins = get_mins(playername)
  threepm = get_threepm(playername)
  threepa = get_threepa(playername)
  threepper = get_threepper(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  orb = get_orb(playername)
  drb = get_drb(playername)
  trb = get_trb(playername)
  ast = get_ast(playername)
  blk = get_blk(playername)
  pf = get_pf(playername)
  trbper = get_trbper(playername)
  astper = get_astper(playername)
  stlper = get_stlper(playername)
  blkper = get_blkper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)
  
  
  fit = lm(formula = tov ~ mins + fga + threepm + threepa + threepper +
                 ftm + fta + orb + drb + trb + ast + blk + pf + trbper + astper +
                 stlper + blkper + tovper + usgper + bpm)
  x0 <- data.frame(mins=mean(mins), threepa=mean(threepa), threepper=mean(threepper), ftm=mean(ftm), fta=mean(fta),
                   ftper=mean(ftper), orb=mean(orb), stl=mean(stl), blk=mean(blk), tov=mean(tov), pf=mean(pf), orbper=mean(orbper),
                   drbper=mean(drbper), trbper=mean(trbper),  astper=mean(astper),
                   stlper=mean(stlper), blkper=mean(blkper), tovper=mean(tovper), usgper=mean(usgper), bpm=mean(bpm))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_3pm <- function(playername) {
  threepm = get_threepm(playername)
  fgm = get_fgm(playername)
  fga = get_fga(playername)
  fgp = get_fgp(playername)
  threepa = get_threepa(playername)
  threepper = get_threepper(playername)
  efg = get_efg(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  drb = get_drb(playername)
  stl = get_stl(playername)
  blk = get_blk(playername)
  tov = get_tov(playername)
  pts = get_pts(playername)
  orbper = get_orbper(playername)
  tovper = get_tovper(playername)
  
  
  fit = lm(formula = threepm ~ fgm + fga + fgp + threepa + threepper +
                 efg + ftm + fta + drb + stl + blk + tov + pts + orbper +
                 tovper)
  x0 <- data.frame(fgm=mean(fgm), fga=mean(fga), fgp=mean(fgp), threepa=mean(threepa), threepper=mean(threepper),
                   efg=mean(efg), ftm=mean(ftm), fta=mean(fta), drb=mean(drb), stl=mean(stl), blk=mean(blk),
                   tov=mean(tov), pts=mean(pts), orbper=mean(orbper), tovper=mean(tovper))
  result <- predict(fit, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_fgm <- function(playername) {
  fgm = get_fgm(playername)
  mins = get_mins(playername)
  fga = get_fga(playername)
  threepm = get_threepm(playername)
  threepa = get_threepa(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  orb = get_orb(playername)
  stl = get_stl(playername)
  pts = get_pts(playername)
  astper = get_astper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)
  threepper = get_threepper(playername)
  trb = get_trb(playername)
  blk = get_blk(playername)
  tov = get_tov(playername)
  tsper = get_tsper(playername)
  orbper = get_orbper(playername)
  drbper = get_drbper(playername)
  trbper = get_trbper(playername)
  blkper = get_blkper(playername)
  
  
  fit_fg_m = lm(formula = fgm ~ mins + fga + threepm + threepa + ftm + fta + 
                  orb + stl + pts + astper + tovper + usgper + bpm)

  x0 <- data.frame(mins=mean(mins), fga=mean(fga), threepm=mean(threepm),
                   threepa=mean(threepa), ftm=mean(ftm), fta=mean(fta), orb=mean(orb), stl=mean(stl), pts=mean(pts),
                   astper=mean(astper), tovper=mean(tovper), usgper=mean(usgper), bpm=mean(bpm))  
  result <- predict(fit_fg_m, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_fga <- function(playername) {
  fgm = get_fgm(playername)
  mins = get_mins(playername)
  fga = get_fga(playername)
  threepm = get_threepm(playername)
  threepa = get_threepa(playername)
  ftm = get_ftm(playername)
  fta = get_fta(playername)
  orb = get_orb(playername)
  stl = get_stl(playername)
  pts = get_pts(playername)
  astper = get_astper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  bpm = get_bpm(playername)
  threepper = get_threepper(playername)
  trb = get_trb(playername)
  blk = get_blk(playername)
  tov = get_tov(playername)
  tsper = get_tsper(playername)
  orbper = get_orbper(playername)
  drbper = get_drbper(playername)
  trbper = get_trbper(playername)
  blkper = get_blkper(playername)
  
  
  fit_fg_a = lm(formula = fga ~ mins + fgm + threepm + threepa + threepper + 
                  fta + trb + blk + tov + pts + tsper + orbper + drbper + trbper + 
                  blkper + usgper)
  
  x0 <- data.frame(mins=mean(mins), fgm=mean(fgm), threepm=mean(threepm),
                   threepa=mean(threepa), threepper=mean(threepper), fta=mean(fta), trb=mean(trb), blk=mean(blk), 
                   tov=mean(tov),
                   pts=mean(pts), tsper=mean(tsper), orbper=mean(orbper), drbper=mean(drbper), trbper=mean(trbper), 
                   blkper=mean(blkper), usgper=mean(usgper))
  result <- predict(fit_fg_a, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_fgper <- function(playername) {
  
  pred1 <- predict_fgm(playername)
  pred2 <- predict_fga(playername)
  result = pred1/pred2
  return(result)
}

predict_ftm <- function(playername) {
  ftm = get_ftm(playername)
  
  mins = get_mins(playername)
  fgm = get_fgm(playername)
  threepm = get_threepm(playername)
  efg = get_efg(playername)
  fta = get_fta(playername)
  ast = get_ast(playername)
  stl = get_stl(playername)
  tov = get_tov(playername)
  pts = get_pts(playername)
  tsper = get_tsper(playername)
  stlper = get_stlper(playername)
  usgper = get_usgper(playername)
  
  fit_ft_m = lm(formula = ftm ~ mins + fgm + threepm + efg + fta + ast + stl + 
                  tov + pts + tsper + stlper + usgper)
  
  x0 <- data.frame(mins=mean(mins), fgm=mean(fgm), threepm=mean(threepm), efg=mean(efg),
                   fta=mean(fta), ast=mean(ast), stl=mean(stl), tov=mean(tov), pts=mean(pts), tsper=mean(tsper),
                   stlper=mean(stlper), usgper=mean(usgper))
  result <- predict(fit_ft_m, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_fta <- function(playername) {
  fta = get_fta(playername)
  mins = get_mins(playername)
  fgm = get_fgm(playername)
  fga = get_fga(playername)
  threepm = get_threepm(playername)
  efg = get_efg(playername)
  ftm = get_ftm(playername)
  orb = get_orb(playername)
  drb = get_drb(playername)
  trb = get_trb(playername)
  ast = get_ast(playername)
  tov = get_tov(playername)
  pts = get_pts(playername)
  tsper = get_tsper(playername)
  orbper = get_orbper(playername)
  drbper = get_drbper(playername)
  stlper = get_stlper(playername)
  tovper = get_tovper(playername)
  usgper = get_usgper(playername)
  
  
  
  fit_ft_a = lm(formula = fta ~ mins + fgm + fga + threepm + efg + ftm + orb + 
                  drb + trb + ast + tov + pts + tsper + orbper + drbper + stlper + 
                  tovper + usgper)
  
  x0 <- data.frame(mins=mean(mins), fgm=mean(fgm), fga=mean(fga), threepm=mean(threepm), efg=mean(efg),
                   ftm=mean(ftm), orb=mean(orb), drb=mean(drb), trb=mean(trb), ast=mean(ast), tov=mean(tov),
                   pts=mean(pts), tsper=mean(tsper), orbper=mean(orbper), drbper=mean(drbper), stlper=mean(stlper),
                   tovper=mean(tovper), usgper=mean(usgper))
  result <- predict(fit_ft_a, x0, interval="confidence", level = 0.95)[1,1]
  return(result)
}

predict_ftper <- function(playername) {
  
  pred1 <- predict_ftm(playername)
  pred2 <- predict_fta(playername)
  result = pred1/pred2
  return(result)
}
