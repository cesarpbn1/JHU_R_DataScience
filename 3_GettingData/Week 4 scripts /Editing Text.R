if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

##command "tolower" makes all letters lowered case
tolower(names(cameraData))

##command "strssplit" automarically splits vairables names
  ##Important parameters: X, split
splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

## command "list" creates a list by adding letters, numbers and matrix
##below are several ways to evalaute the list 
mylist <- list(letters = c ("A", 'b', "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

install.packages("sapply")

##by using command " sapply " and " strssplit "
## you can remove periods and names from data frames 
splitNames[6][1]
firstElement <- function(x){x[1]}
sappply(splitNames, firstElement)

##Observing another data group
fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileURL1, destfile = "./data/reviews.csv", method ="curl")
download.file(fileURL2, destfile = "./data/solutions.csv", method ="curl")
reviews <-read.csv("./data/reviews.csv"); solutions <- read.csv("./data.solutions.csv")
head(reviews, 2)

## command "sub" removes single patterns and can replace with something else 
## command "g sub " removes multiple character patterns/vectors
names(reviews)
sub("_", "", names(reviews), )
testName <- "this_is_a_test"
gsub("_", "", testName)

## command "grep " finds the values a search string in a spefiic search variable 
## command " grepl " gives you a table of values by gicing you a TRUE OR FALSE
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
##you can also usbset your data by using grpl
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection), ]
cameraData2
## you can also you value = TRUE as one of the paramters in " grep " and will tell you integers when they appear
grep("Alameda", cameraData$intersection, value = TRUE)
grep("JeffStreet", cameraData$intersection)
## command "length " can tell you numerically if integer appears or not
length(grep("JeffStreet", cameraData$intersection))

library(stringr)
nchar("Jeffrey Leek")
## command "substr " is an useful string by taking part of a string 
## ad find specific information about it
substr("Jeffrey Leek", 1, 7)
##command "paste" can put two strings together with space, "paste0" does it w/out space
paste("Jeffrey", "Leek")
paste0("Jeffrey", "Leek")

##commmand "str_trim" will trim off excess space at the end or beginning of a string 
str_trim("Jeff    ")


















