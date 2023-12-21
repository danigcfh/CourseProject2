
#plot6
#find scc codes for vehicles
SCC_vehicles <- subset(SCC, grepl("Vehicles", EI.Sector))

#subset data for baltimore
data_balt <- subset(NEI, NEI$fips=="24510")
data_balt_vehicles <- subset(data_balt , data_balt$SCC %in% unique(SCC_vehicles$SCC))

#subset data for los angeles
data_LA <- subset(NEI, NEI$fips=="06037")
data_LA_vehicles <- subset(data_LA , data_LA$SCC %in% unique(SCC_vehicles$SCC))

#merge data for both cities
data_2cities <- rbind(data_LA_vehicles, data_balt_vehicles)

#sumarize by year and city
data_cities <- data_2cities %>% group_by(year,fips)%>% summarize(sum(Emissions))

#plot data
png("plot6.png")
ggplot(data_cities)+
  geom_line(aes(year, `sum(Emissions)`,col=as.factor(fips)))+
  xlab("Year")+
  ylab("Emissions")+
  scale_color_discrete(name = "City", labels = c("LA", "Baltimore"))
dev.off()

