## Question 2:
##Have total emissions from PM2.5 decreased in the 
##Baltimore City, Maryland ( 𝚏𝚒𝚙𝚜 == 𝟸
##𝟺𝟻𝟷𝟶) from 1999 to 2008? 
##Use the base plotting system to make a plot answering 
##this question

#Step 1:Load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Step 2: Subset NEI data using Baltimore's fips information
BaltNEI <- NEI[NEI$fips=="24510",]

#Step 3: Aggregate the sum of Baltimore's emissions data by year
TotalaggBalt <- aggregate(Emissions ~ year, BaltNEI,sum)

#Step4: Create a png
png("plot2.png", width=500, height=500)
 
#Step 5: Create a plot
barplot(
        TotalaggBalt$Emissions,
        names.arg=TotalaggBalt$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total Emissions From all Baltimore City Sources"
)

dev.off()

#Question 2: #Have total emissions from PM2.5 decreased in the 
##Baltimore City, Maryland ( 𝚏𝚒𝚙𝚜 == 𝟸𝟺𝟻𝟷𝟶)
##from 1999 to 2008?

  #Answer: Total emissions from PM2.5 have decreased 
  #        in Baltimore City, Maryland from 1999 to 2008.