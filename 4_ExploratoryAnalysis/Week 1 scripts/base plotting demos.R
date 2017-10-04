## base plotting demo
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x, y)

z <- rnorm(100)
plot(x, z)
plot(x, y)

##you can change the size margin using par and mar
par(mar =c(4, 4, 2, 2))
plot(x, y)

## command pch changes the format fo the dots, smaller the #
## the bigger the dot
plot(x, y, pch =20)
plot(x, y, pch =11)

## command " example(points) " provides many demos 
## scatter or dots 
example(points)

## command title adds a title 
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch =20)
title("scatterplot")
##command "text" adds a label at a coordinate 
##command legend adds a legend but you mest state location
#topright, topleft etc
text(-2, 2, "label")
legend("topleft", legend = "Data", pch = 20)

##commands lm followed by abline adds a linear regression line 
fit <- lm(y ~ x)
abline(fit)
## command lwd adjust the thickness of line and command
## col changes color
abline(fit, lwd = 3, col = "blue")

## you can put a lot of these commands in plot
## xlab, ylab, and main chnage the labels 
plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <-lm(y ~ x)
abline(fit, lwd = 3, col = "red")

##potting using 2 graphs in one 
z <- rpois(100, 2)
## top plot x vs y on same canvas use par and mfrow = c(a, b, c, d)
##where par and mfrow are used as coordinates to place 
##the graph 
par(mfrow = c(2, 1))
plot(x, y, pch =20)
plot(x, z, pch = 20)
par("mar")
par(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mfrow = c(4, 4, 2, 2))
plot(x, y, pch =20)
plot(x, z, pch = 20)

##to plot 4 graphs you again use par and mfrow =c 
## but as coordinates you use c (a, b)
## you cna also use mfcol = c(a, b) however order of graphs
##will differ as the graphs would start instead of rows
##start in columns or up down as opposed to left right 
par(mfrow = c(2, 2))
plot(x, y)
plot(x, z)
plot(y, x)
plot(y, z)

##to reset plot use par and mfrow = c (1, 1)
par(mfrow = c(1, 1))
x <-rnorm(100)
y <- x + rnorm(100)
##use gl to make a group or matrix
g <- gl(2, 50)
g <- gl(2, 50, labels = c("Male", "Female"))
##str tells you your paramters 
str(g)
plot(x, y)
##now lets add different colors ot male and female
## in order to do this you must add these in steps
## first male then females 
  
  ##first step: plot x,y and add type = "n" which only 
  ## records the date in the plot but doesnt display it
  plot(x, y, type = "n")

  ##second step: add group at a time by using points 
  ## and subsetting the vector, do males first 
  ##points function can be used to add points sequentially
  ##by group so that you can specify which diff types of properties for each gorup
  points(x[g == "Male"], y[g == "Male"], col = "green")
  ##now lets do female
  points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 20)
  
  




