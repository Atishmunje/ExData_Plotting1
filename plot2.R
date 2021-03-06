#reading data

library(data.table)
data_full <- fread("/Users/Atish/Documents/household_power_consumption.txt",header=T,sep=";")
data_full$DateTime  <- paste(data_full$Date, data_full$Time, sep=" ")
data_full$DateTime  <-  as.POSIXct(strptime(data_full$DateTime, format = "%d/%m/%Y %H:%M:%S"))

# subsetting required data
data  <- subset(data_full, DateTime >= as.POSIXct("2007-02-01") &  DateTime < as.POSIXct("2007-02-3"))

#plot 2

png("plot2.png",width=480,height=480)
with(data,plot(DateTime,as.numeric(Global_active_power),xlab ="", ylab = "Global Active Power (Kilowatts)",type= "l"))
dev.off()