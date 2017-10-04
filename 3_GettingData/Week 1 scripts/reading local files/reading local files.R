setwd("/Users/cesar/desktop/Coursera_Data_Science/Course 3/week 1 scripts")
getwd()


fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
dowload.file(fileUrl, destfile = "camera.csv", method = "curl")
dateDowloaded <- date( )
dateDowloaded

cameraData <- read.table("./reading local files/cameras.csv")
head(cameraData)

cameraData <- read.table("./reading local files/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

cameraData <- read.csv("./reading local files/cameras.csv")
head(cameraData)



