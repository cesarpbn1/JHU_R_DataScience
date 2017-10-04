install.packages("JSON")
install.packages("jsonlite", repos = "http://cran.r-project.org")

## Loadin a JSON file from an website
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names
names(jsonData$owner)
jsonData$owner$login

## Convert file/dataframe (iris) to JSON
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

## Convert file back from JSON  
iris2 <- fromJSON(myjson)
head(iris2)

