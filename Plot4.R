library(data.table)
data <- fread(file.path(getwd(),'exdata_data_household_power_consumption/household_power_consumption.txt'))
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[Date>="2007-02-01" & Date<="2007-02-02"]
data$Global_active_power <- as.numeric(data$Global_active_power)
data[,Date_Time:= strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")] 
png('Plot4.png')
par(mfcol=c(2,2))

plot(data$Date_Time, data$Global_active_power, type="l", xlab=" ", ylab="Global Active Power")

plot(data$Date_Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date_Time, data$Sub_metering_2,col="red")
lines(data$Date_Time, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3"), lwd=c(1,1))

plot(data$Date_Time,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Date_Time,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()