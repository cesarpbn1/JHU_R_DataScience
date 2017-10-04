## Question 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileName <- tempfile()
download.file(fileURL, fileName, method = "curl")

data <- read.csv(fileName)
strsplit(names(data), "\\wgtp")[123]

##Question 2
gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdpFile <- "./data/GDP.csv"
download.file(gdpURL, gdpFile, method = "curl")

gdpData <- read.csv(gdpFile, skip = 5, nrows = 190, stringsAsFactors = F, header = F)
gdpData <- gdpData[, c(1, 2, 4, 5)]
colnames(gdpData) <- c("CountryCode", "Rank", "Country.Name", "GDP.Value")
mean(as.numeric(gsub(",", "", gdpData$GDP.Value)))

## Question 3
length(grep("^United",gdpData$Country.Name))

## Question 4
eduData  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
eduFile <- "./data/EDU.csv"
download.file(eduData, eduFile, method = "curl")

eduData <- read.csv(eduFile, stringsAsFactors = F)
eduData <- eduData[, c("CountryCode", "Special.Notes")]

mergedData <- merge(gdpData, eduData, as.x = "CountryCode", as.y = "CountryCode")

length(grep("[Ff]iscal year end(.*)+June", mergedData$Special.Notes))

##Question 5
library(lubridate)
library(quantmod)
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)

sampleTimes = ymd(sampleTimes)
sampleTimes = round_date(sampleTimes, "year")
Y2012 <- subset(sampleTimes, year(sampleTimes) == 2012)
length(Y2012)
length((wday(Y2012, label = T) == "Mon"))








