
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot4
#find the codes for coal
SCC_Coal <- subset(SCC, grepl("Coal", EI.Sector))

#subset the data to isolate the emissions from coal
data_coal <- subset(NEI , NEI$SCC %in% unique(SCC_Coal$SCC))

#plot the data
png("plot4.png")
plot(data_coal %>% group_by(year)%>% summarize(sum(Emissions)), 
     type="l",
     ylab = "Emissions",
     xlab = "Year")
dev.off()
