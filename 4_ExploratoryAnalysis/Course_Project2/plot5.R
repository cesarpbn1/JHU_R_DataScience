## Question 5:
##How have emissions from motor vehicle sources changed 
## from 1999–2008 in Baltimore City?

#Step 1: Load ggplot2
library(ggplot2)

#Step 2:Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 3: Subset the vehicle NEI data using fips 
Vehi <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VehiSCC <- SCC[Vehi,]$SCC
VehiNEI <- NEI[NEI$SCC %in% VehiSCC,]
BaltVehiNEI <- VehiNEI[VehiNEI$fips=="24510",]


#Step 4: Create a png
png("plot5.png", width=500, height=500)

#Step 5: Create a ggplot to observe data
ggplot(BaltVehiNEI, aes(factor(year), Emissions)) +
        geom_bar(stat="identity",fill="red",width=0.80) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year", y="PM2.5 Emissions (Tons)") + 
        labs(title="Emissions From Motor Vehicle Sources in Baltimore City")

dev.off()



## Question 5:
##How have emissions from motor vehicle sources changed 
##from 1999–2008 in Baltimore City?

#Answer: Emissions from  motor vehicle sources have
# consistenly decreased from 1999-2008
