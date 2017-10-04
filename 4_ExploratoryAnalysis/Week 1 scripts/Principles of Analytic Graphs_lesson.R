install.packages("jpeg")
library(jpeg)
library(swirl)
swirl()

##command "head" loads a entry already in R
library(pollution)
head(pollution)

##command "dim " prompts lenght of table
dim(pollution)

##command "summary" gives a 5-number summary 
## which returns 6 numbers
summary(pollution$pm25)

##command "quantile" measures at which 25%, 50%, and
## 75% 
quantile(ppm)

boxplot(ppm, col = "blue")

##command abline "adds one or more straight lines 
##through the current plot." 
abline(h = 12)

##commmand "hist" provides a histogram about
##the distribution 
hist(ppm, col = "green")

#command "rug" shows (through density of tick marks) 
##the greatest concentration 
rug(ppm)
low
high

hist(ppm, col = "green", breaks = 100)

abline(v = 12, lwd = 2)
abline(v = 12, lwd=2)
abline(v = median(ppm), col = "magenta", lwd = 4)

names(pollution)
reg <- table(pollution$region)
reg

##command "main" provides the header or title
barplot(reg, col = "wheat", main = "Number of Counties in Each Region")

boxplot(pm25 ~ region, data = pollution, col = "red")
par(mfrow=c(2,1),mar=c(4,4,2,1))

## boolean expression means " ==" 
east <- subset(pollution,region=="east")
head(east)
hist(east$pm25, col = "green")

hist(subset(pollution,region=="west")$pm25, col = "green")

##command "with" can 
with(pollution, plot(latitude, pm25))

##command "lty" gives you a dashed line on h
abline(h = 12, lwd = 2, lty = 2)

abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))

west <- subset(pollution,region=="west")

plot(west$latitude, west$pm25, main = "West")

plot(west$latitude, west$pm25, main = "West")

plot(east$latitude, east$pm25, main = "East")






