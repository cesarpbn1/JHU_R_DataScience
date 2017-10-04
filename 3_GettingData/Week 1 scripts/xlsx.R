if (!file.exists("reading excel files")) {dir.create("reading excel files")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./reading excel files/cameras.xlsx", method="curl")

dateDowloaded <- date()
dateDowloaded

library(xlsx)
cameraData <- read.xlsx("./reading excel files/cameras.xlsx", sheetIndex=1, header = TRUE)
head(cameraData)


library(xlsx)
colIndex <- 2:3
colIndex
rowIndex
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("reading excel files/camera.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
cameraDataSubset

 

