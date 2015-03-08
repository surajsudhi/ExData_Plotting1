if(file.exists("./load_data.R")){
  source("load_data.R")
  #create the plot
  plot(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_2,type="l", col="red")
  lines(HPCdatasubset$timestamp,HPCdatasubset$Sub_metering_3,type="l", col="blue")
  legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),cex=0.5)
  dev.copy(png,"./plot3.png",width=480,height=480)
  dev.off()
  print(paste("plot3.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}