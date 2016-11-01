## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter column SCC on values corresponding to "coal combustion-related sources" in Short Name  

SCC_Coal <- SCC[grepl("Coal" , SCC$Short.Name), ]$SCC

# Filter NEI on SCC in SCC_Coal

NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal, ]

# Plotting 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

library(ggplot2)

png("plot4.png")

ggplot(NEI_Coal, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("total PM2.5") + ggtitle("Total coal combustion-related PM2.5 Emissions")

dev.off()
