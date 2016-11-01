## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting

NEI_Balimore <- subset(NEI, fips == "24510")

# Aggregate : Sum Emissions per type and year

PM_Balt_type_year <- aggregate(NEI_Balimore[c("Emissions")], list(type = NEI_Balimore$type, year = NEI_Balimore$year), sum)


# Plotting 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?

library(ggplot2)

png("plot3.png")

ggplot(PM_Balt_type_year, aes(year, Emissions, color = type))  + geom_line() + xlab("year") + ylab(expression ("total PM2.5")) +  
        ggtitle("Total Emissions in Baltimore City, by Year and Type")

dev.off()

     