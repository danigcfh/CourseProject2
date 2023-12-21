NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Plot 2
#subset data for baltimore
data_balt <- subset(NEI, NEI$fips=="24510")
#sumarize data by year
data_balt_year <-  data_balt %>% group_by(year)%>% summarize(sum(Emissions))
#plot data
png("plot2.png")
plot(data_balt_year , ylab = "Total Emissions", xlab = "Year", type="l")
dev.off()
