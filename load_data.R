if (!exists("HPCdatasubset")) {
  getwd()
  # If the zip file with dataset is already downloaded to working directory
  if (!file.exists("./household_power_consumption.zip")){
  # Download the zip file  
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.zip",mode="wb")
}
#Read the file contents 
HPCdata <- read.table(unz("./household_power_consumption.zip","household_power_consumption.txt"),sep=";",header=TRUE,na.strings=c("?"))
#Get Date column converted to date object
HPCdata[,"Date"] <- as.Date(HPCdata[,"Date"],format="%d/%m/%Y")
#Subset the rows based on the required dates only
HPCdatasubset <- HPCdata[HPCdata[,"Date"]%in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
rm(HPCdata)
# Creating the timestamp column
temp <- paste(as.character(HPCdatasubset[,"Date"]),as.character(HPCdatasubset[,"Time"]))
# Setting the data type for all the other columns
HPCdatasubset[,"timestamp"] <- as.POSIXct(strptime(temp,"%Y-%m-%d %H:%M:%S"))
HPCdatasubset$Global_active_power <- as.numeric(as.character(HPCdatasubset$Global_active_power))
HPCdatasubset$Global_reactive_power <- as.numeric(as.character(HPCdatasubset$Global_reactive_power))
HPCdatasubset$Voltage <- as.numeric(as.character(HPCdatasubset$Voltage))
HPCdatasubset$Global_intensity <- as.numeric(as.character(HPCdatasubset$Global_intensity))
HPCdatasubset$Sub_metering_1 <- as.numeric(as.character(HPCdatasubset$Sub_metering_1))
HPCdatasubset$Sub_metering_2 <- as.numeric(as.character(HPCdatasubset$Sub_metering_2))
HPCdatasubset$Sub_metering_3 <- as.numeric(as.character(HPCdatasubset$Sub_metering_3))
print("The data objects have been created")
rm(temp)
}


