#plot1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

YEARLY_TOTAL <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot(height=YEARLY_TOTAL$Emissions, names.arg=YEARLY_TOTAL$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))


dev.off()
