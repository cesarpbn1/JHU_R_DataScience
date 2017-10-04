set.seed(13435)
X <- data.frame("var1" sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
X <- X [sample(1:5), ]; X$var2[c(1, 3)] = NA
X

X[, 1]
X[, "var1"]
X[(X$var1 <= 3 & X$var3 > 11), ]

## symbol " | " means " or "
X[(X$var1 <= 3 | X$var3 > 15), ]
X[which(X$var2 > 8), ]

## command sort places variable do w/e desired (increasing or decreasing)
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)

## order a dataframe or sort a row by increasing order and can be done using plyr
X[order(X$var1), ]
X[order(X$var1,X$var3), ]

## in PLyr you can use the " arrange " command take sthe dataframe and tell it a variable which is 
## sorted by increasing order -> arrange increases ; desc decreases 
library(plyr)
arrange(X, var1)
arrange(X, desc(var1))

## adding rows and columns by using the rnorm coommand or the cbind commmand 
X$var4 <- rnorm(5)
X
 Y <- cbind(X, rnorm(5))
 Y
 Y2 <- cbind(rnorm(5), X)
 Y2
________________________________________________________
 
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")

##look at the data set
## command " head " starts your data at the top and command " n = X " tells how howmany  
head(restData, n = 3)

## command " tail " start tells you the bottom data and command " n = X " tells
tail(restData, n = 3)

## command "summary " gives you a little summary and 
## command " str " gives you even a little more summary (speifics about data)
summary(restData)
str(restData)

#command "quantile " to look at quantile variability, command "probs" gives
## you probability 
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))

#command "table " makes a table, command "useNa " gives missing values 
table(restData$zipCode, useNA = "ifany")
## 2D table
table(restData$councilDistrict, restData$zipCode)

##command " is.na " gives you missing values, if it returns a " 1 " there
## is a missing value if it returns a " 0 " there are nomissing values
sum(is.na(restData$councilDistrict))
## command " any " will look all values and return False/True
any(is.na(restData$councilDistrict))
## command " all " check and see " IF " and return TRUE/FALSE
all(restData$zipCode > 0)

## command "colSums" takes sums accross columns and rows, returns a False?true ten number
colSums(is.na(restData))
all((colSums(is.na(restData))) == 0)

##Values with specific characteristics can use command "table"
## eeual equal or " %n% "
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))

## Use logical variabvle to subset a dataset
restData[restData$zipCode %in% c("21212", "21213"), ]

## Make a summary or Crosstabs with data sets observed
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

##To make a crosstab use command " xtabs " 
## in the example, variable " Freq " or first spot or varibale/info you want to
## be displayed un the table. 
 xt <- xtabs(Freq ~ Gender + Admit, data =  DF)
 xt

 ##You can also do cross tabs for larger number of variables
 ## It cab be diffult to see so usually you want to make several 2D tables
 warpbreaks$replicate <- rep(1:9, len = 54)
 xt = xtabs(breaks ~., data = warpbreaks)
 xt
 
 #a nice way to summary is to create  a flat table by using command "ftable)
 ftable(xt)

 #command " object.size " seizes the size of the data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units = "MB")

##Summary:
## Shown were some ways you can just take a look at your data when you 
## load to " R "









 
 
 




