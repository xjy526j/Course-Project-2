

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")

# plot 1
emission <- tapply(data$Emissions, data$year, sum)
png("plot1.png")
barplot(emission, xlab = "Year", ylab ="PM2.5 Emissions", main = "Total PM2.5 Emissions")
dev.off()