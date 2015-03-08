if(file.exists("./load_data.R")){
  source("load_data.R")
  #create the histogram
  hist(HPCdatasubset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.copy(png,file="plot1.png",width=480, height=480)
  dev.off()
  print(paste("plot1.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}