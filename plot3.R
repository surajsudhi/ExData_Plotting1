if(file.exists("./load_data.R")){
  # Use the "load_data.R" Rscript to download the file, create and clean dataset. A seperate script is used
  # as each plot can be executed independently.
  source("load_data.R")
  #create the plot
  plot(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_2,type="l", col="red")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_3,type="l", col="blue")
  legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),cex=0.5)
  #Copy the plot to png file  
  dev.copy(png,"./plot3.png",width=480,height=480)
  dev.off()
  print(paste("plot3.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}