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

## Lattice Panel Functions 

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
##Plot with 2 panels
xyplot(y ~ x | f, layout = c(2, 1))
