library(swirl)
library(ggplot2)

head(pollution)
dim(pollution)
summary(pollution$pm25)
quantile(ppm)
boxplot(ppm, col = "blue")
abline(h = 12)
hist(ppm, col = "green")
rug(ppm)
rug(low)
rug(ppm, low)
low
high

hist(ppm, col = "green", breaks = 100)
rug(ppm)
hist(ppm, col = "green")
abline(v = median(ppm), col = "magenta", lwd = 4)

run(ppm)
names(pollution)
table(pollution$region)
reg <- table(pollution$region)
barplot(reg, col = "wheat", main = "Number of Counties in Each Region")

boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow=c(2,1),mar=c(4,4,2,1))

east <- subset(pollution,region=="east")

head(east)

hist(east$pm25, col = "green")

west <- subset(pollution, region == "west")
hist(east$pm25, west$pm25, col = "green")

hist(subset(pollution,region=="west")$pm25, col = "green")

with(pollution, plot(latitude, pm25))

abline(h = 12, lwd = 2, lty = 2) 

par(mfrow = c(1,2), mar = c(5, 4, 2, 1))

west <- subset(pollution, region == "west")

plot(west$latitude, west$pm25, main = "West")

east <- subset(pollution, region == "east")

plot(east$latitude, east$pm25, main = "East")

?Devices

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.cur()

pdf(file="myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")

dev.off()
dev.cur()


with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()

___________

head(pollution)
summary(pollution)
head(pollution)
dim(pollution)

hist(ppm, col = "brown")

hist(ppm, main = "fusia")

hist(ppm, main = "ppm", col = "purple")

rug(ppm)
low
abline(h= mean(ppm), col = "green", lwd = 2, lty = 3)
abline(v = mean(ppm), col = "blue", lwd =3 )

par(mfrow= c(2, 1), mar = c(4, 4, 2, 1))
east <- subset(pollution, region == "east")
main(east)
hist(east$pm25, col = "green", main = "east")
hist(subset(pollution, region =="west")$pm25, col = "purple", main = "west")

par(mfrow= c(1, 2), mar = c(4, 4, 2, 1))
hist(subset(pollution, region =="west")$pm25, col = "purple", main = "west")
abline( v = mean(ppm), col = "blue", lwd = 2, lty = 11)
hist(subset(pollution, region =="east")$pm25, col = "green", main = "east")
abline( h = 12, col = "red", lwd = 3, lty = 10)

par(mfrow= c(2, 1), mar = c(4, 4, 2, 1))
east <- subset(pollution, region == "east")
plot(east$latitude, east$pm25, col = "blue", main = "east")
abline( h = 12, lwd = 2, col = "green")
west <- subset(pollution, region == "west")
plot(west$latitude, west$pm25, col ="purple", main = "west")
abline( h = mean(ppm), lwd = 1, col = "pink")

dev.cur()

pdf(file = "scatteringplotexample.pdf")
par(mfrow= c(2, 1), mar = c(4, 4, 2, 1))
east <- subset(pollution, region == "east")
plot(east$latitude, east$pm25, col = "blue", main = "east")
abline( h = 12, lwd = 2, col = "green")
west <- subset(pollution, region == "west")
plot(west$latitude, west$pm25, col ="purple", main = "west")
abline( h = mean(ppm), lwd = 1, col = "pink")

head(ppm)












