## Question 4:
##Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999–2008?

#Step 1: Load ggplot2
library(ggplot2)

#Step 2:Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 3: Subset the coal combustion related NEI data
combustR <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalR <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (combustR & coalR)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

#Step 4: Create a png
png("plot4.png", width=500, height=500)

#Step 6: Create a ggplot to observe data
ggplot(combNEI, aes(factor(year), Emissions)) +
        geom_bar(stat="identity", fill="blue", width=0.80) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year", y="PM2.5 Emissions (Tons)") + 
        labs(title="Emissions From Coal Combustion-Related Sources across U.S.A.")

dev.off()
       


## Question 4:Across the United States, how have emissions from coal 
##            combustion-related sources changed from 1999–2008?

              #Answer: Emissions from coal combustion-related sources have
              # consistenly decreased from 1999-2008
