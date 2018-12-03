library("ggplot2")
library("dplyr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_SUBSET  <- filter(NEI, NEI$fips == "24510")

TOTAL_BY_YEAR_AND_TYPE <- aggregate(Emissions ~ year + type, NEI_SUBSET, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(TOTAL_BY_YEAR_AND_TYPE, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
