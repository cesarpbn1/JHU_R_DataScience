# 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

## READ DATA This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#vector of years
year<-unique(unique(NEI$year))

# Total (sum) of PM2.5 from all sorces
Total_PM2.5Table<-data.frame( Years= year, 
                              Total.PM2.5=(with(NEI, tapply(Emissions,year, sum, na.rm=TRUE)))/(1))

#Fit a Linear Model to the Data
model <- lm(Total_PM2.5Table[,2] ~ Total_PM2.5Table[,1], Total_PM2.5Table)

#OPEN PNG FILE#
png(file= "plot1.png" ,width = 780, height = 480 )

#GENERATE PLOT1
par(mfrow=c(1,2))
par(oma=c(0,0,1,0))
bar<- barplot(Total_PM2.5Table$Total.PM2.5, col= rgb(0,0,1, 0.2),
              ylab= "Total PM2.5 [tons]", main= "Barplot", xlab= "Years")
plot(Total_PM2.5Table, pch=19, col="blue",
     ylab= "Total PM2.5 [tons]", 
     main="Scatter Plot with linear model fitted",
     ylim=c(0,7.5e6))
lines(Total_PM2.5Table, col= "blue", lty= 3)
abline(model, lwd = 1, col="green")

title( main= "Total PM2.5 emission from all sources from 1999-2008 in tons", outer = TRUE)
dev.off()

_____________

# 2)Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data from Baltimore City
Baltimore<-subset(NEI, fips== "24510")

#vector of years
year<-unique(unique(Baltimore$year))

# Total (sum) of PM2.5 from all sorces
Total_PM2.5Table<-data.frame( Years= year, 
                              Total.PM2.5=(with(Baltimore, 
                                                tapply(Emissions,year, sum, na.rm=TRUE))))

#Fit a Linear Model to the Data
model <- lm(Total_PM2.5Table[,2] ~ Total_PM2.5Table[,1], Total_PM2.5Table)

#OPEN PNG FILE#
png(file= "plot2.png" ,width = 780, height = 480 )

#GENERATE PLOT2
par(mfrow=c(1,2))
par(oma=c(0,0,1,0))

bar<- barplot(Total_PM2.5Table$Total.PM2.5, col= rgb(0,0,1, 0.2),
              ylab= "Total PM2.5 [tons]", main= "Barplot", xlab= "Years")

plot(Total_PM2.5Table, pch=19, col="blue",
     ylab= "Total PM2.5 [tons]", main="Scatter Plot with linear model fitted",
     ylim= c(0, 3200))

lines(Total_PM2.5Table, col= "blue", lty= 3)

abline(model, lwd = 1, col="green")

title( main= "Total PM2.5 emission of the city of Baltimore from all sources from 1999-2008 in tons", 
       outer = TRUE)

dev.off()

_____

#3)Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
#variable, which of these four sources have seen decreases in emissions
#from 1999-2008 for Baltimore City? Which have seen increases in emissions
#from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.


#Library help subset data faster
library(dplyr)
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data from Baltimore City
Baltimore<-subset(NEI, fips== "24510")
Baltimore$type<-factor(Baltimore$type, 
                       levels = c("NONPOINT", "POINT","NON-ROAD","ON-ROAD"))


#vector of years
year<-unique(unique(Baltimore$year))
types<-unique(unique(Baltimore$type)) 

# Total (sum) of PM2.5 from all sorces
Total_PM2.5Table<-data.frame( summarise((group_by(Baltimore,year, type)), 
                                        sum(Emissions)))  
Total_PM2.5Table[,1]<-as.factor(Total_PM2.5Table[,1])
colnames(Total_PM2.5Table)<-c("Years", "Type", "Total.Emissions")


#OPEN PNG FILE#
png(file= "plot3.png" ,width = 780, height = 480 )

#Generate Plot3
ggplot(data=Total_PM2.5Table, aes(Type,Total.Emissions, fill=Years)) +
        geom_bar(stat="identity", position=position_dodge(), colour="black") +
        labs(title = "Total PM2.5 emission of the city of Baltimore by sources from 1999-2008 in tons ")


dev.off()

____

#Library help subset data faster
library(dplyr)
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Filter SCC# that haveCoal in the Name
CoalCat<-filter(SCC , grepl('Coal', Short.Name))[,1]

#Filter PM2.5 Data by SCC that has Coal in their names
NEICoal<-subset( NEI, NEI$SCC %in% CoalCat)
NEICoal$SCC<- as.factor(NEICoal$SCC)



#vector of years
year<-unique(unique(NEICoal$year))

# Total (sum) of PM2.5 from all sorces
Total_PM2.5Table<-data.frame( Years= year, 
                              Total.PM2.5=(with(NEICoal, 
                                                tapply(Emissions,year, sum, na.rm=TRUE))))

#Fit a Linear Model to the Data
model <- lm(Total_PM2.5Table[,2] ~ Total_PM2.5Table[,1], Total_PM2.5Table)
rgn<-range(Total_PM2.5Table[,2])

#OPEN PNG FILE#
png(file= "plot4.png" ,width = 780, height = 480 )

#GENERATE PLOT1
par(mfrow=c(1,2))
par(oma=c(0,0,1,0))
bar<- barplot(Total_PM2.5Table$Total.PM2.5, col= rgb(0,0,1, 0.2),
              ylab= "Total PM2.5 [tons]", main= "Barplot", xlab= "Years",ylim=c(0, rgn[2]))

plot(Total_PM2.5Table, pch=19, col="blue",
     ylab= "Total PM2.5 [tons]", 
     main="Scatter Plot with linear model fitted", ylim=c(0, rgn[2]))
lines(Total_PM2.5Table, col= "blue", lty= 3)
abline(model, lwd = 1, col="green")

title( main= "Total PM2.5 emission from Coal sources from 1999-2008 in tons", outer = TRUE)
dev.off()

______


#5)How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


#Library help subset data faster
library(dplyr)
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data from Baltimore City
Baltimore<-subset(NEI, fips== "24510")

#Filter SCC# that have Vehicle in the Name
CarSCC<-filter(SCC , grepl('Vehicle', Short.Name))[,1]

#Filter PM2.5 Data by SCC that has Coal in their names
BCars<-subset( Baltimore, Baltimore$SCC %in% CarSCC)


#vector of years
year<-unique(unique(NEICoal$year))

# Total (sum) of PM2.5 from all sorces
Total_PM2.5Table<-data.frame( Years= year, 
                              Total.PM2.5=(with(BCars, 
                                                tapply(Emissions,year, sum, na.rm=TRUE))))

#Fit a Linear Model to the Data
model <- lm(Total_PM2.5Table[,2] ~ Total_PM2.5Table[,1], Total_PM2.5Table)
rgn<-range(Total_PM2.5Table[,2])


#OPEN PNG FILE#
png(file= "plot5.png" ,width = 780, height = 480 )

#GENERATE PLOT1
par(mfrow=c(1,2))
par(oma=c(0,0,1,0))
bar<- barplot(Total_PM2.5Table$Total.PM2.5, col= rgb(0,0,1, 0.2),
              ylab= "Total PM2.5 [tons]", main= "Barplot", xlab= "Years",ylim=c(0, rgn[2]))

plot(Total_PM2.5Table, pch=19, col="blue",
     ylab= "Total PM2.5 [tons]", 
     main="Scatter Plot with linear model fitted", ylim=c(0, rgn[2]))
lines(Total_PM2.5Table, col= "blue", lty= 3)
abline(model, lwd = 1, col="green")

title( main= "Total PM2.5 emission from vehicle sources in Baltimore City from 1999-2008 in tons", outer = TRUE)
dev.off()
_____

#6)Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?


#Library help subset data faster
library(dplyr)
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Subset data from Baltimore City & LA
Baltimore<-subset(NEI, fips== "24510" | fips== "06037")

#Filter SCC# that have Vehicle in the Name
CarSCC<-filter(SCC , grepl('Vehicle', Short.Name))[,1]

#Filter PM2.5 Data by SCC that has Coal in their names
BCars<-subset( Baltimore, Baltimore$SCC %in% CarSCC)
for( i in 1: (length(BCars[,1]))){
        if(BCars[i,1]=="24510" ){BCars[i,1]<- "Baltimore"  }else{BCars[i,1]<- "LA" }
}

# Total (sum) of PM2.5 
Total_PM2.5Table<-data.frame( summarise((group_by(BCars,year, fips)), 
                                        sum(Emissions)))  

colnames(Total_PM2.5Table)<-c("Years", "City", "Total.Emissions")


#OPEN PNG FILE#
png(file= "plot6.png" ,width = 780, height = 480 )

#Generate Plot3
qplot(y = Total.Emissions, x = Years, data = Total_PM2.5Table, 
   color = City) + geom_point(size = 3) + 
        geom_line() +scale_x_continuous(breaks = seq(1999, 2008, 3))+
        labs(title = "Total PM2.5 emission from vehicle sources in Baltimore City and Los Angeles from 1999-2008 in tons")



dev.off()
