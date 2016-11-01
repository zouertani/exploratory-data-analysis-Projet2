## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting : motor vehicle /  in Baltimore City

NEI_Balimore_Road <- subset(NEI, fips == "24510" & type=="ON-ROAD")

# Aggregate

Emissions_Baltimore_Road <- tapply(NEI_Balimore_Road$Emissions, NEI_Balimore_Road$year, sum)


# Plotting 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?


png("plot5.png")

plot(names(Emissions_Baltimore_Road), Emissions_Baltimore_Road, type="l", xlab = "Year", ylab = expression ("total PM2.5"), main = expression("Total Motor Emissions in Baltimore by Year"), col="red")

dev.off()
