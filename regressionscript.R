library(alr3)
library(rvest)

# This R script is used to test data models based on league wide data. The data file used is a csv file that contains
# the season averages of each player in the NBA

# points data
# plotting data
player_data <- read.csv("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/playerdata.csv", header=1)
mins <- player_data[,7]
pts <- player_data[,29]
fgm <- player_data[,8]
fga <- player_data[,9]
fgp <- player_data[,10]
threepm <- player_data[,11]
threepar <- player_data[,32]
twopm <- player_data[,14]
twopar <- 1 - threepar
ftm <- player_data[,18]
fta <- player_data[,19]
ftp <- player_data[,20]
ftar <- player_data[,33]
usgr <- player_data[,41]
tsp <- player_data[,31]
efg <- player_data[,17]

# rebounding data
rbs <- player_data[,23]
rbper <- player_data[,36]


# assists data
asts <- player_data[,24]
astsper <- player_data[,37]


# the models for predicting points
fit1 <- lm(pts~mins+usgr+fgm+ftm)
summary(fit1)
fit2 <- lm(pts~mins+fga+fta)
summary(fit2)
fit3 <- lm(pts~mins+tsp+usgr)
summary(fit3)
fit4 <- lm(pts~mins+usgr+fgp+ftp)
summary(fit4)
fit5 <- lm(pts~mins+fgm+fga+ftm+fta+efg)
summary(fit5)
fit6 <- lm(pts~mins+fgm+fga+ftm+fta+tsp)
summary(fit6)
fit7 <- lm(pts~mins+fgm+fga+fta+ftm+usgr)
summary(fit7)


# the model for predicting rebounds
fit_rbs <- lm(rbs~mins+rbper)
summary(fit_rbs)

# the model for predicting assists
fit_asts <- lm(asts~mins+astsper)
summary(fit_asts)


# calculating a confidence interval
player_data <- read.csv("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/NBA Players/FredVanVleet.csv", header=1, encoding = 'UTF-8')
x0 <- data.frame(mins=27.5, rbper=5.1)
result1 <- predict(fit_rbs, x0, interval="confidence", level = 0.95)

player_data <- read.csv("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/NBA Players/FredVanVleet.csv", header=1, encoding = 'UTF-8')
x0 <- data.frame(mins=35.7, astsper=23.9)
result2 <- predict(fit_asts, x0, interval="confidence", level = 0.95)
# x0 <- data.frame(mins=35.7, usgr=27.1, fgm=5.9, ftm=3.1)
# result1 <- predict(fit1, x0, interval="confidence", level = 0.95)
# result2 <- predict(fit2, x2, interval="confidence", level = 0.95)
# result4 <- predict(fit4, x4, interval="confidence", level = 0.95)
# result5 <- predict(fit5, x5, interval="confidence", level = 0.95)
# result7 <- predict(fit7, x7, interval="confidence", level = 0.95)
# mean(result1[1,1], result2[1,1], result4[1,1], result5[1,1], result7[1,1])


# # testing assumptions
# plot(adjmins, adjpts)
# plot(fitted(fit1), residuals(fit1))
# hist(residuals(fit1))
# boxplot(residuals(fit1))
# qqnorm(residuals(fit1))
# # testing for constancy of variance
# e <- fit1$residuals
# table <- cbind(adjmins, e)
# #t(table)
# orderedbyx <- table[order(adjmins),]
# orderedbyx <- data.frame(orderedbyx)
# #t(orderedbyx)
# eorderedbyx <- orderedbyx$e
# n <- nrow(table)
# n1 <- ceiling(n/2)
# n2 <- n-n1
# e1 <- eorderedbyx[1:n1]
# e2 <- eorderedbyx[c((n1+1):n)]
# med1 <- median(e1)
# med2 <- median(e2)
# d1 <- abs(e1-med1)
# d2 <- abs(e2-med2)
# d1bar <- mean(d1)
# d2bar <- mean(d2)
# s_sq <- (sum((d1-d1bar)^2) + sum((d2-d2bar)^2))/(n-2)
# s <- sqrt(s_sq)
# tBF <- (d1bar-d2bar)/(s*sqrt(1/n1 + 1/n2))
# 
# summary(fit1)
# summary(fit1)$"coefficients"[2,3]
# # summary(fit1)$"coefficients"[1,3]
# qt(1-0.05/2, n-2)
# summary(fit1)$"coefficients"[2,3] <= qt(1-0.05/2, n-2)
# # summary(fit1)$"coefficients"[1,3] <= qt(1-0.05/2, n-2)
# abs(tBF)
# qt(1-0.05/2, n-2)
# abs(tBF) <= qt(1-0.05/2, n-2)
# 
# 
# #anova(fit1)
# pureErrorAnova(fit1)
# pureErrorAnova(fit1)[3,4]
# qf(1-0.05, pureErrorAnova(fit1)[3,1], pureErrorAnova(fit1)[4,1])
# pureErrorAnova(fit1)[3,4] <= qf(1-0.05, pureErrorAnova(fit1)[3,1], pureErrorAnova(fit1)[4,1])




