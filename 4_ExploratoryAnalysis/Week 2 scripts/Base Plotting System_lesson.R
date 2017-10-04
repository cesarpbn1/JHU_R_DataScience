##The core plotting and graphics engine in R is
#encapsulated in two packages. The first is the graphics
# package which contains plotting functions for the "base"
# system. The functions in this package include plot, hist,
# boxplot, barplot, etc. The second package is grDevices
# which contains all the code implementing the various
# graphics devices, including X11, PDF, PostScript, PNG,
# etc.

##Base graphics are often constructed piecemeal, with each
# aspect of the plot handled separately through a
# particular function call. Usually you start with a plot
# function (such as plot, hist, or boxplot), then you use
# annotation functions (text, abline, points) to add to or
# modify your plot.

head(airquality)
##command range gives interval of variables you want to work with
range(airquality$Ozone,na.rm=TRUE)

##command hist gives you a histogram 
hist(airquality$Ozone)


##command table gives you a quick table of what you want 
table(airquality$Month)

##boxplot gives you a boxplot graph specify a title 
## and axis labels for you automatically.
boxplot(Ozone~Month, airquality)

## commands "col.lab" provides color and commands 
## "xlab" provides name of axis
boxplot(Ozone~Month, airquality, xlab="Month", ylab="Ozone (ppb)",col.axis="blue",col.lab="red")

##command title gives you title 
title(main="Ozone and Wind in New York City")

##command with can give you a plot by calling dataset
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in New York City")

##command "par" stand for parameters
length(par())
names(par())
par()$pin
par()$fg

##argument pch stands for plot character 
par("pch")

## argument lty stands for line type and width
par("lty")

## commands dev.off or plot.new 
## are used to reset to the defaults

##mfrow and mfcol, both deal with multiple
##plots in that they specify the number of 
## plots per row and column. 

title(main="Wind and Ozone in NYC")

may <- subset(airquality, Month==5)
points(may$Wind,may$Ozone,col="blue",pch=17)
notmay <- subset(airquality, Month!=5)
points(notmay$Wind,notmay$Ozone,col="red",pch=8)
legend("topright",pch=c(17,8),col=c("blue","red"),legend=c("May","Other Months"))

abline(v=median(airquality$Wind),lty=2,lwd=2)
par(mfrow=c(1,2))
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")
plot(airquality$Ozone, airquality$Solar.R, main = "Ozone and Solar Radiation")

## 3 plots
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(airquality$Wind, airquality$Ozone, main ="Ozone and Wind")

plot(airquality$Solar.R, airquality$Ozone, main = "Ozone and Solar Radiation")

plot(airquality$Temp, airquality$Ozone, main = "Ozone and Temperature")

mtext("Ozone and Weather in New York City", outer = TRUE)
