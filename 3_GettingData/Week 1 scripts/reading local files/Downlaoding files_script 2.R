setwd("/Users/cesar/Desktop/")
getwd()

if (!file.exists("poopoo")) {
        dir.create("mazel")
}

setwd("/Users/cesar/Desktop/Coursera_Data_Science/")
 getwd()

if (!file.exists("Course 3")) {
        dir.create("Course 3")
}

setwd("/Users/cesar/Desktop/Coursera_Data_Science/Course 3/Week 1 scripts")
getwd()


if (!file.exists("Week 1 scripts")) {
        dir.create("Week 1 scripts")
}

getwd()

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD "

download.file(fileUrl, destfile = "./Week 1 scripts/cameras.csv", method = "curl")

list.files("./Week 1 scripts")

dateDownloaded <- date()
dateDownloaded





