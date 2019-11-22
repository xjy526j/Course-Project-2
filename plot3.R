library(ggplot2)

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge data
data <- merge(NEI, SCC, by = "SCC")
data <- data[data$fips == "24510", ]

# plot 3
png("plot3.png")
g <- ggplot(data, aes(year, Emissions, fill = type)) + guides(fill=FALSE)+ facet_grid(.~type) + geom_bar(stat="identity") +  scale_size_identity(0.1) + labs(title = "Baltimore City PM2.5 Emissions") + xlab("") + ylab("PM2.5 Emissions") 
print(g)
dev.off()