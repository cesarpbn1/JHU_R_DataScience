library(UsingR)
data(galton) 
library(reshape2)
long <- melt(galton)
library(ggplot2)
g <- ggplot(long, aes(x = value, fill = variable))
g <- g + geom_histogram(colour = "black", binwidth = 1)
g <- g + facet_grid(. ~ variable)
g

install.packages("manipulate")

##using the commmand manipulate which allows to manually look for the mean also
##known as lowest value for this particular sum
library(manipulate)
myHist <- function(mu){
        mse <- mean((galton$child - mu)^2)
        g <- ggplot(galton, aes(x = child)) + geom_histogram(fill = "salmon", colour = "black", binwidth = 1)
        g <- g + geom_vline(xintercept = mu, size = 3)
        g <- g + ggtitle(paste("mu = ", mu, ", MSE = ", round(mse, 2), sep = ""))
        g
}
manipulate(myHist(mu), mu =slider(62, 74, step = 0.5))

##without using manipulate and having the mean automized 
g <- ggplot(galton, aes(x = child)) + geom_histogram(fill = "salmon", colour = "black", binwidth = 1)
g <- g + geom_vline(xintercept = mean(galton$child), size = 2)
g