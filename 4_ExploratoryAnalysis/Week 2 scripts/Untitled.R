install.packages("ggplot2")
library("ggplot2")

##example data set
str(mpg)

## function belows follows:
## qplot(x coordinate, y coordinate, data = dataframe)
qplot(displ, hwy, data = mpg)

##Modifying Aesthetics 
##command color = drv changes color automcatically 
## to different 
qplot(displ, hwy, data = mpg, color = drv)


