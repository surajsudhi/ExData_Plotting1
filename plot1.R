if(file.exists("./load_data.R")){
  # Use the "load_data.R" Rscript to download the file, create and clean dataset. A seperate script is used
  # as each plot can be executed independently.
  source("load_data.R")
  #create the histogram
  hist(HPCdatasubset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
  #Copy the plot to png file  
  dev.copy(png,file="plot1.png",width=480, height=480)
  dev.off()
  print(paste("plot1.png has been created at ",getwd()))
}else {
  print(paste("load_data.R file required in ",getwd()))
}