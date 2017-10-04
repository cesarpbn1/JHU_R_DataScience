## Question 1:
##Have total emissions from PM2.5 decreased in the United States
##from 1999 to 2008? Using the base plotting system, make a plot 
##showing the total PM2.5 emission from all sources for each of 
##the years 1999, 2002, 2005, and 2008. Upload a PNG file containing
##your plot addressing this question.

#Step 1: Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 2: Take a quick look at data
str(NEI)

#Step 3: Aggregate data by sum of total emissions by year
totalagg <- aggregate(Emissions ~ year,NEI, sum)

#Step 4: Create png file
png("plot1.png", width=500, height=500)

#Step 5: Plot total 
barplot(totalagg$Emissions,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total Emissions From All U.S.A. Sources"
        )

dev.off()

#Question:Have total emissions from PM2.5 decreased in 
##the United States from 1999 to 2008?

   #Answer:According to the plot, total emissions have 
   #       decreased in the US from 1999 to 2008.
