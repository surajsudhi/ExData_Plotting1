if(file.exists("./load_data.R")){
  # Use the "load_data.R" Rscript to download the file, create and clean dataset. A seperate script is used
  # as each plot can be executed independently.
  source("load_data.R")
  #create the plot
  plot(HPCdatasubset$timestamp,HPCdatasubset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)", xlab="")
  #Copy the plot to png file  
  dev.copy(png,"./plot2.png",width=480,height=480)
  dev.off()
  print(paste("plot2.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}