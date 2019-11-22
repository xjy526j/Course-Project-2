library(ggplot2)

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")
data <- data[data$fips == "24510" | data$fips == "06037", ]
vehicle <- filter(data, type == "ON-ROAD" | type == "NON-ROAD")
vehicle$fips <- gsub("24510", "Baltimore City", vehicle$fips)
vehicle$fips <- gsub("06037", "Los Angeles", vehicle$fips)

# plot 6
png("plot6.png")
g <- ggplot(vehicle, aes(year, Emissions, fill = fips) )+ guides(fill=FALSE) + geom_bar(stat = "identity") + facet_grid(.~fips) + labs(title = "Vehicles Emissions Comparison") + xlab("") + ylab("PM2.5 Emissions")
print(g)
dev.off()
