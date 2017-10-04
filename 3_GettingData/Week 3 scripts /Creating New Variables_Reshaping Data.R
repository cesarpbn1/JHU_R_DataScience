## Find and download data directory
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")

## Creating sequence and used to index a data set by using command "seq "  
## where " 1 " or first number is the min value and " 10 " is the max
## the command "by = " means that it skips every 2 spots
## the length command does the same thing 
s1 <- seq(1, 10, by = 2); s1
s2 <- seq(1, 10, length = 3); s2
## commonad "seq = along " gives you consecituve indeces 
x <- c(1, 3, 8, 25, 100); seq(along = x)

##Subsetting variables
##command %n% tells you exactly what you want to find out in this case
## the number of restaurnts in the neighborhoods provided 
restData$nearMe = restData$neighborhood %in% c("Roland Park", "homeland")
table(restData$nearMe)

##Creating binary variables 
## command " ifelse " works with two variables
## in our case if its smaller than 0 it will provide a TRUE?FALSE
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

