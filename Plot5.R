NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot5
#find scc codes for vehicles
SCC_vehicles <- subset(SCC, grepl("Vehicles", EI.Sector))
#subset data for baltimore
data_balt <- subset(NEI, NEI$fips=="24510")
#subset data for vehicles in baltimore
data_balt_vehicles <- subset(data_balt , data_balt$SCC %in% unique(SCC_vehicles$SCC))
#plot data
png("plot5.png")
plot(data_balt_vehicles %>% group_by(year)%>% summarize(sum(Emissions)), 
     type="l",
     ylab = "Emissions",
     xlab = "Year")
dev.off()