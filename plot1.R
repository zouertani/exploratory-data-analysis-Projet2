## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate : total PM2.5 year
EmissionsPerYear <-  with(NEI, tapply(Emissions, year, sum,na.rm = TRUE))

# Plotting 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
png("plot1.png")

plot(names(EmissionsPerYear), EmissionsPerYear, type="l", xlab = "Year", ylab = expression ("total PM2.5"), main = expression("Total Emissions by Year"), col="red")

dev.off()
