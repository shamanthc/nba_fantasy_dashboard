library(alr3)


# This R script is used to test data models on an individual player's data set. The dataset used is a csv file
# containing the player's game log (i.e. the player's stats for each game)

# plotting data
player_data <- read.csv("H:/Backup/Documents/Shamanth's Folder/Fantasy Dashboard/NBA Players/FredVanVleet.csv", header=1, encoding = 'UTF-8')
team_name <- tail(player_data)[1,4]
team_name
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

# adjmins <- sqrt(mins)
# adjpts <- log(pts)

fit1 <- lm(pts~mins+usgr+ftm+fgm)
# x1 <- data.frame(mins=mean(mins), usgr=mean(usgr), ftm=mean(ftm), fgm=mean(fgm))
pts1 <- predict(fit1, x1, interval="confidence", level = 0.95)
x1 <- data.frame(mins=35.7, usgr=27.1, ftm=3.1, fgm=5.9)
# pts1 <- predict(fit1, x1, interval="confidence", level = 0.95)
# new_usgr <- 100*((14.3+0.44*3.9+2.2)*(242.4/5))/(35.7*(89.1+0.44*22+14))


fit2 <- lm(pts~mins+fga+fta)
# x2 <- data.frame(mins=mean(mins), fta=mean(fta), fga=mean(fga))
# pts2 <- predict(fit2, x2, interval="confidence", level = 0.95)
x2 <- data.frame(mins=35.7, fga=14.3, fta=3.7)
pts2 <- predict(fit2, x2, interval="confidence", level = 0.95)


fit3 <- lm(pts~mins+tsp+usgr)
# x3 <- data.frame(mins=mean(mins), tsp=mean(tsp), usgr=mean(usgr))
# pts3 <- predict(fit3, x3, interval="confidence", level = 0.95)
x3 <- data.frame(mins=35.7, tsp=0.553, usgr=21.7)
pts3 <- predict(fit3, x3, interval="confidence", level = 0.95)

fit4 <- lm(pts~mins+usgr+ftp+fgp)
# x4 <- data.frame(mins=mean(mins), usgr=mean(usgr), ftp=mean(ftp), fgp=mean(fgp))
# pts4 <- predict(fit4, x4, interval="confidence", level = 0.95)
x4 <- data.frame(mins=35.7, usgr=21.7, ftp=0.848, fgp=0.413)
pts4 <- predict(fit4, x4, interval="confidence", level = 0.95)

fit5 <- lm(pts~mins+ftm+fgm+fta+fga+efg)
# x5 <- data.frame(mins=mean(mins), ftm=mean(ftm), fgm=mean(fgm), fta=mean(fta), fga=mean(fga), efg=mean(efg))
# pts5 <- predict(fit5, x5, interval="confidence", level = 0.95)
x5 <- data.frame(mins=35.7, ftm=3.1, fgm=5.9, fta=3.7, fga=14.3, efg=0.507)
pts5 <- predict(fit5, x5, interval="confidence", level = 0.95)

fit6 <- lm(pts~mins+ftm+fgm+fta+fga+tsp)
# x6 <- data.frame(mins=mean(mins), ftm=mean(ftm), fgm=mean(fgm), fta=mean(fta), fga=mean(fga), tsp=mean(tsp))
# pts6 <- predict(fit6, x6, interval="confidence", level = 0.95)
x6 <- data.frame(mins=35.7, ftm=3.1, fgm=5.9, fta=3.7, fga=14.3, tsp=0.553)
pts6 <- predict(fit6, x6, interval="confidence", level = 0.95)

fit7 <- lm(pts~mins+ftm+fgm+fta+fga+usgr)
# x7 <- data.frame(mins=mean(mins), ftm=mean(ftm), fgm=mean(fgm), fta=mean(fta), fga=mean(fga), usgr=mean(usgr))
# pts7 <- predict(fit7, x7, interval="confidence", level = 0.95)
x7 <- data.frame(mins=35.7, ftm=3.1, fgm=5.9, fta=3.7, fga=14.3, usgr=21.7)
pts7 <- predict(fit7, x7, interval="confidence", level = 0.95)


pts1[1,1]
pts2[1,1]
pts3[1,1]
pts4[1,1]
pts5[1,1]
pts6[1,1]
pts7[1,1]
vec <- c(pts1[1,1],pts2[1,1],pts3[1,1],pts4[1,1],pts5[1,1],pts6[1,1],pts7[1,1] )
mean(vec)


# fit2 <- lm(pts~mins+usgr+tsp)
# summary(fit1)
# summary(fit2)



# testing assumptions
plot(adjmins, adjpts)
plot(fitted(fit1), residuals(fit1))
hist(residuals(fit1))
boxplot(residuals(fit1))
qqnorm(residuals(fit1))
# testing for constancy of variance
e <- fit1$residuals
table <- cbind(adjmins, e)
#t(table)
orderedbyx <- table[order(adjmins),]
orderedbyx <- data.frame(orderedbyx)
#t(orderedbyx)
eorderedbyx <- orderedbyx$e
n <- nrow(table)
n1 <- ceiling(n/2)
n2 <- n-n1
e1 <- eorderedbyx[1:n1]
e2 <- eorderedbyx[c((n1+1):n)]
med1 <- median(e1)
med2 <- median(e2)
d1 <- abs(e1-med1)
d2 <- abs(e2-med2)
d1bar <- mean(d1)
d2bar <- mean(d2)
s_sq <- (sum((d1-d1bar)^2) + sum((d2-d2bar)^2))/(n-2)
s <- sqrt(s_sq)
tBF <- (d1bar-d2bar)/(s*sqrt(1/n1 + 1/n2))

summary(fit1)
summary(fit1)$"coefficients"[2,3]
# summary(fit1)$"coefficients"[1,3]
qt(1-0.05/2, n-2)
summary(fit1)$"coefficients"[2,3] <= qt(1-0.05/2, n-2)
# summary(fit1)$"coefficients"[1,3] <= qt(1-0.05/2, n-2)
abs(tBF)
qt(1-0.05/2, n-2)
abs(tBF) <= qt(1-0.05/2, n-2)


#anova(fit1)
pureErrorAnova(fit1)
pureErrorAnova(fit1)[3,4]
qf(1-0.05, pureErrorAnova(fit1)[3,1], pureErrorAnova(fit1)[4,1])
pureErrorAnova(fit1)[3,4] <= qf(1-0.05, pureErrorAnova(fit1)[3,1], pureErrorAnova(fit1)[4,1])