
# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")
data <- data[data$fips == "24510", ]

# plot 2
emission <- tapply(data$Emissions, data$year, sum)
png("plot2.png")
barplot(emission, xlab = "Year", ylab ="PM2.5 Emissions", main = "Baltimore City PM2.5 Emissions")
dev.off()