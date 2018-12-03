install.packages("dplyr")
library("dplyr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_SUBSET  <- filter(NEI, NEI$fips == "24510")

YEARLY_TOTAL <- aggregate(Emissions ~ year, NEI_SUBSET, sum)

png('plot2.png')
barplot(height=YEARLY_TOTAL$Emissions, names.arg=YEARLY_TOTAL$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions in various years'))
dev.off()
