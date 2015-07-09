##Reading in the data to R

Data<-read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(Data)<-c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Creating a vector with the Global Active Power data

Global_Active_Power<-NULL
for(i in 1:nrow(Data)) {
      Global_Active_Power[i]<-Data[i,3]
}

##Converting the character dates and times to POSIXlt and POSIXt dates and times

Data[ ,10]<-paste(Data[ ,1],Data[ ,2], sep = " ")
Whole_Time<-strptime(Data[ ,10], format = "%d/%m/%Y %H:%M:%S")

##Creating the plot

plot(Whole_Time,Global_Active_Power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

##Copying to PNG file

dev.copy(png, file="plot2.png")
dev.off()
