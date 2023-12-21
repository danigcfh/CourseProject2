NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#plot3
#subset data for baltimore
data_balt <- subset(NEI, NEI$fips=="24510")
#sumarize data by year and type
data_balt_type <-  data_balt %>% group_by(year,type)%>% summarize(sum(Emissions))
#plot data
png("plot3.png")
ggplot(data_balt_type) +
  geom_line(aes(year,`sum(Emissions)`, col = as.factor(type)))
dev.off()