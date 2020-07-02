library(data.table)
data <- fread(file.path(getwd(),'exdata_data_household_power_consumption/household_power_consumption.txt'))
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[Date>="2007-02-01" & Date<="2007-02-02"]
data$Global_active_power <- as.numeric(data$Global_active_power)
data[,Date_Time:= strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")] 
png('Plot2.png')
plot(data$Date_Time,data$Global_active_power,type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()