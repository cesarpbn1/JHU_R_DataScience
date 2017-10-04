library(swirl)

## command head gives you an argument and 
## lets you see what the data looks like.
head(cars)

##comand with lets you see the argument and plot at same time
with(cars, plot(speed, dist))

##command text(X, y, z) lets you label the x and y axis plust title
text(mean(cars$speed),max(cars$dist),"SWIRL rules!")

head(state)
##command table provides specific called categories 
table(state$region)

## formula Life.Exp ~Income | region
##indicates we're plotting life expectancy 
##as it depends on income for each region
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))
xyplot(Life.Exp ~ Income | region, data = state, layout = c(2, 2))

head(mpg)
##command dim w/ an argument tells you 
##how big the dataset is
dim(mpg)

table(mpg$model)

## the ggplot2 command qplot displays effects on two
##variables
qplot(displ, hwy, data = mpg)
      