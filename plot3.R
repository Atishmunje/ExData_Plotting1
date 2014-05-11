#reading data

library(data.table)
data_full <- fread("/Users/Atish/Documents/household_power_consumption.txt",header=T,sep=";")
data_full$DateTime  <- paste(data_full$Date, data_full$Time, sep=" ")
data_full$DateTime  <-  as.POSIXct(strptime(data_full$DateTime, format = "%d/%m/%Y %H:%M:%S"))

# subsetting required data
data  <- subset(data_full, DateTime >= as.POSIXct("2007-02-01") &  DateTime < as.POSIXct("2007-02-3"))


#plot 3

png("plot3.png",width=480,height=480)
plot(data$DateTime,as.numeric(data$Sub_metering_1),xlab="",ylab = "Energy sub metering",type ="l",col="black") 
lines(data$DateTime,as.numeric(data$Sub_metering_2),xlab="",type ="l",col="red")
lines(data$DateTime,as.numeric(data$Sub_metering_3),xlab="",type ="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
