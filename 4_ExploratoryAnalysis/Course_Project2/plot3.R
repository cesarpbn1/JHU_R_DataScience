## Question 3:
##Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (po
##int, nonpoint, onroad, nonroad) variable, which of these 
##four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#Which have seen increases in emissions from 1999–2008?
##Use the ggplot2 plotting system to make a plot answer this question���

#Step 1: Load ggplot2
library(ggplot2)

#Step 2:Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 3: Subset NEI data using Baltimore's fips information
BaltNEI <- NEI[NEI$fips=="24510",]

#Step 4: Aggregate the sum of Baltimore's emissions data by year
TotalaggBalt <- aggregate(Emissions ~ year, BaltNEI,sum)

#Step 5: Create a png
png("plot3.png", width=500, height=500)

#Step 6: Create a ggplot to observe data
ggplot(BaltNEI, aes(factor(year), Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y="PM2.5 Emissions (Tons)") + 
        labs(title="Emissions by Source type in Baltimore City")

dev.off()

## Question 3a: Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (po
##int, nonpoint, onroad, nonroad) variable, which of these 
##four sources have seen decreases in emissions from 1999–2008 for Baltimore City?

  #Answer 3a:The nonpoint, on-road, off-road source types have seen consistent 
  #          emission  decrease from 1999-2008 in Baltimore City.

##Question 3b:Which have seen increases in emissions from 1999–2008?

  #Answer  3b:The point source saw the most significant overall
  #           increase from 1999-2005.  However, 
  #           it then decreased from 2005-2008   