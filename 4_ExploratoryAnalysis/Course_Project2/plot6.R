## Question 6:
##Compare emissions from motor vehicle sources in Baltimore City  
## with emissions from motor vehicle sources in 
## Los Angeles County, California (𝚏𝚒𝚙𝚜 == 𝟶𝟼𝟶𝟹𝟽). 
## Which city has seen greater changes over time in motor vehicle emissions?

#Step 1: Load ggplot2
library(ggplot2)

#Step 2:Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 3: Subset the vehicle NEI data using fips and label cities 
Vehi <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VehiSCC <- SCC[Vehi,]$SCC
VehiNEI <- NEI[NEI$SCC %in% VehiSCC,]
#  Baltimore 
BaltVehiNEI <- VehiNEI[VehiNEI$fips=="24510",]
BaltVehiNEI$city <- "Baltimore City"
#  LA
VehiLANEI <- VehiNEI[VehiNEI$fips=="06037",]
VehiLANEI$city <- "Los Angeles County"

# Merge Baltimore & LA subsets
DosNEI <- rbind(BaltVehiNEI, VehiLANEI)


#Step 4: Create a png
png("plot6.png", width=500, height=500)

#Step 5: Create a ggplot to observe data
ggplot(DosNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="Year", y="PM2.5 Emissions (Tons)") + 
        labs(title="Motor Vehicle Source Emissions in Baltimore & LA")

dev.off()



## Question 6:
## Which city has seen greater changes over time in motor vehicle emissions?

#Answer: LA has seen the greatest changes over time in motor vehicle emissions.
