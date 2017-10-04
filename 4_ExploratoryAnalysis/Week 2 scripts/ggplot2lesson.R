##ggplot2 aka grammar of graphics plot
## is a hybrid of the base & lattice systems

install.packages("ggplot2")
library("ggplot2")

##example data set
str(mpg)

##LETS LOOK AT QPLOT
## function belows follows:
## qplot(x coordinate, y coordinate, data = dataframe)
qplot(displ, hwy, data = mpg)

##Modifying Aesthetics 
##command color = drv changes color automcatically 
## to different 
qplot(displ, hwy, data = mpg, color = drv)

##Adding a geom aka statisitc
## geom = "point" gives you points and "smooth" gives you a 
## a curved line of mean
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

##Adding a histogram on qplot
## for adding a hist only sepficy the x and ommit the displ argument
qplot(hwy, data = mpg, fill= drv)

##command "facets" provides panels in this lattice system 
## where you can create different subsets or graphs of data
qplot(displ, hwy, data = mpg, facets =.~drv)

##command bindwidth splits out the substes into three
##scatterplots.  careful changing the parameters
## for "facets" and elimating displ
## " ~ " deals with columns
qplot(hwy, data = mpg, facets = drv~., binwidth= 2)


