
# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")
data <- data[data$fips == "24510", ]
vehicle <- filter(data, type == "ON-ROAD" | type == "NON-ROAD")

# plot 5
emission <- tapply(vehicle$Emissions, vehicle$year, sum)
png("plot5.png")
barplot(emission, xlab = "Year", ylab ="PM2.5 Emissions", main = "PM2.5 Emissions from motor vehicle sources in Baltimore City")
dev.off()