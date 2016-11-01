## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting : motor vehicle /  in Los Angeles or in Baltimore City

NEI_LosAngeles_Road <- subset(NEI, (fips == "24510" OR fips == "06037") & type=="ON-ROAD" )


# Aggregate : Emissions per year and fips

Emissions_Comparaison <- aggregate(sub2[c("Emissions")], list(fips = sub2$fips, year = sub2$year), sum)

# Plotting 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources # 
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

png("plot6.png")

ggplot(Emissions_Comparaison, aes(year, Emissions, color = fips))  + geom_line() + xlab("year") + ylab(expression ("total PM2.5")) +  
        +     ggtitle("Total Emissions in Baltimore City, by Year and Type")
dev.off()
