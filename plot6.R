library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
NEI_SUBSET <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

YEARLY_TOTAL_AND_FIPS <- aggregate(Emissions ~ year + fips, NEI_SUBSET, sum)
YEARLY_TOTAL_AND_FIPS$fips[YEARLY_TOTAL_AND_FIPS$fips=="24510"] <- "Baltimore, MD"
YEARLY_TOTAL_AND_FIPS$fips[YEARLY_TOTAL_AND_FIPS$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(YEARLY_TOTAL_AND_FIPS, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
