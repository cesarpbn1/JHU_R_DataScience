head(cars)
dim(cars)
summary(cars)

# baseplotting system using *now( dataset, plot( name, name))

with(cars, plot(speed, dist))


text(mean(cars$speed), max(cars$dist), "SWIRL rules!")

head(state)
summary(state)
dim(state)
table(state$region)
summary(state$region)

# lattice system plotting using *xyplot (argument2/column2 ~ argument3/column3
## | argument1/column1, data = name of dataset, layout = c( #, #))
### in which layout creats the vector for data to be placed in

xyplot(Life.Exp ~ Income | region, data = state, layout = c (4,1))

# ggplot2 is a hybrid of lattice and baseplotting and follows command:
##


summary (mpg)
dim(mpg)
head(mpg)
table(mpg$manufacturer)

qplot(displ, hwy, data = mpg)



