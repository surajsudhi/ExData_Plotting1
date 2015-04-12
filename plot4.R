if (!file.exists("./exdata-data-household_power_consumption.zip")){
    # Download the zip file  
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./exdata-data-household_power_consumption.zip",mode="wb")
}
file_data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";")
# Converting the date into correct format
file_data$Date <- as.Date(file_data$Date,'%d/%m/%Y')
# Subset of the file_data for the dates of 2007-02-01 and 2007-02-02
file_data <- file_data[file_data$Date %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')),]
#Converting other columns to right format
file_data$Global_active_power <- as.numeric(as.character(file_data$Global_active_power))
file_data$Global_reactive_power <- as.numeric(as.character(file_data$Global_reactive_power))
file_data$Voltage <- as.numeric(as.character(file_data$Voltage))
file_data$Global_intensity <- as.numeric(as.character(file_data$Global_intensity))
file_data$Sub_metering_1 <- as.numeric(as.character(file_data$Sub_metering_1))
file_data$Sub_metering_2 <- as.numeric(as.character(file_data$Sub_metering_2))
file_data$Sub_metering_3 <- as.numeric(as.character(file_data$Sub_metering_3))
#timestamp column to be created 
temp <- paste(as.character(file_data$Date),file_data$Time)
file_data[,"Timestamp"] <- as.POSIXct(strptime(temp,"%Y-%m-%d %H:%M:%S"))

#create plot4
png(filename = "plot4.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
par(mfrow=c(2,2))
plot(file_data$Timestamp,file_data$Global_active_power,xlab="",ylab="Global Active Power", type="l")

plot(file_data$Timestamp,file_data$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(file_data$Timestamp,file_data$Sub_metering_1, xlab="",ylab="Energy sub metering", type="l")
lines(file_data$Timestamp,file_data$Sub_metering_2, col="red")
lines(file_data$Timestamp,file_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, bty="n")

plot(file_data$Timestamp,file_data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", type="l")
dev.off()
rm(file_data)
rm(temp)

