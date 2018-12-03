library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

NEI_SUBSET <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

YEARLY_TOTAL <- aggregate(Emissions ~ year, NEI_SUBSET, sum)
png("plot5.png", width=840, height=480)
g <- ggplot(YEARLY_TOTAL, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
