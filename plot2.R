if(file.exists("./load_data.R")){
  source("load_data.R")
  #create the plot
  plot(HPCdatasubset$timestamp,HPCdatasubset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)", xlab="")
  dev.copy(png,"./plot2.png",width=480,height=480)
  dev.off()
  print(paste("plot2.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}