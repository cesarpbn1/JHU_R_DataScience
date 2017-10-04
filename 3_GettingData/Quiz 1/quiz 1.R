if (!file.exists("quiz")) {
        dir.create("quiz")
}

getwd()

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./quiz/06hid.csv", method = "curl")
dateDownloaded <- date()
dateDowloaded


HD <- read.csv("./quiz/06hid.csv")
sum(!is.na(HD[HD$VAL >= 24, 37]))


if (!file.exists("quiz q 3")) {
        dir.create("quiz q 3")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./quiz q 3/gas.xlsx", method = "curl")
dateDownloaded <- date()
dateDowloaded


