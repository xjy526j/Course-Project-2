
# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")
coal <- filter(data, grepl("Coal", EI.Sector))

# plot 4
emission <- tapply(coal$Emissions, coal$year, sum)
png("plot4.png")
barplot(emission, xlab = "Year", ylab ="PM2.5 Emissions", main = "PM2.5 Emissions from coal combustion-related sources")
dev.off()