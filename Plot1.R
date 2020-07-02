library(data.table)
data <- fread(file.path(getwd(),'exdata_data_household_power_consumption/household_power_consumption.txt'))
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data<-data[Date>="2007-02-01" & Date<="2007-02-02"]
data$Global_active_power <- as.numeric(data$Global_active_power)
png('Plot1.png')
hist(data$Global_active_power, col = 'Red', ylab = 'Frequency', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()