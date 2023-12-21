NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#plot 1
#summarize data by year
data <- NEI %>% group_by(year)%>% summarize(sum(Emissions))
#plot data
png("plot1.png")
plot(data, ylab = "Total Emissions", xlab = "Year", type="l")
dev.off()
