library(lattice)

## " | " creates conditions 
xyplot(y ~ x | f * g, data)

library(datasets)
##simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

## Example of plotting ozone vs wind looking at Month
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))
## Lattice Behavior example
p <-xyplot(Ozone ~Wind, data = airquality)
##In orderto see the graph you must "print" it
print(p)
xyplot(Ozone ~Wind, data = airquality)

## LATTICE PANEL FUNCTIONS 

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
##Plot with 2 panels
xyplot(y ~ x | f, layout = c(2, 1))

##CUSTOM PANEL FUNCTIONS
xyplot(y ~ x | f, panel = function(x, y, ...){
        ##1st call the default panel function for xyplot
        panel.xyplot(x, y, ...)
        ## add horizontal line at the median
        panel.abline(h = median(y), lty = 2)
})        

##CUSTOM PANEL FUNCTIONS: REGRESSION LINE
xyplot(y ~ x | f, panel = function(x, y, ...){
        ##1st call the default panel function 
        panel.xyplot(x, y, ...)
        ## Overlay a simple linear regression line
        panel.lmline(x, y, col = 2)
}) 



