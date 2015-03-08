if(file.exists("./load_data.R")){
  # Use the "load_data.R" Rscript to download the file, create and clean dataset. A seperate script is used
  # as each plot can be executed independently.
  source("load_data.R")
  #create the plot
  par(mfrow= c(2,2))
  #Plot1 
  plot(HPCdatasubset$timestamp,HPCdatasubset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)", xlab="")
  #Plot2
  plot(HPCdatasubset$timestamp,HPCdatasubset$Voltage,type="l",ylab="Voltage", xlab="datetime")
  #Plot 3
  plot(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_2,type="l", col="red")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_3,type="l", col="blue")
  legend("topright",col=c("black","red","blue"),bty="n", legend=c(" Sub_metering_1"," Sub_metering_2"," Sub_metering_3"),lty=c(1,1),cex=.31)
 #Plot 4
 plot(HPCdatasubset$timestamp,HPCdatasubset$Global_reactive_power,type="l",ylab="Global Reactive Power(kilowatts)", xlab="datetime")
 #Copy the plot to png file  
 dev.copy(png,"./plot4.png",width=480,height=480)
  dev.off()
  print(paste("plot4.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}