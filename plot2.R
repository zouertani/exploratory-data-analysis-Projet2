## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting

NEI_Balimore <- subset(NEI, fips == "24510")

# Aggregate
Emissions_Baltimore <- tapply(NEI_Balimore$Emissions, NEI_Balimore$year, sum)


# Plotting 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?


png("plot2.png")

plot(names(Emissions_Baltimore), Emissions_Baltimore, type="l", xlab = "Year", ylab = expression ("total PM2.5"), main = expression("Total Emissions in Baltimore by Year"), col="red")

dev.off()
