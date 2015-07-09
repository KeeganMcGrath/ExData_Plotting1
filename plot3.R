##Reading in the data to R
Data<-read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(Data)<-c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Creating vectors with Sub_metering data
Sub_metering_1<-NULL
Sub_metering_2<-NULL
Sub_metering_3<-NULL

for(i in 1:nrow(Data)) {
      Sub_metering_1[i]<-Data[i,7]
}
for(i in 1:nrow(Data)) {
      Sub_metering_2[i]<-Data[i,8]
}
for(i in 1:nrow(Data)) {
      Sub_metering_3[i]<-Data[i,9]
}

##Converting the character dates and times to POSIXlt and POSIXt dates and times

Data[ ,10]<-paste(Data[ ,1],Data[ ,2], sep = " ")
Whole_Time<-strptime(Data[ ,10], format = "%d/%m/%Y %H:%M:%S")

##Creating the plot

plot(Whole_Time,Sub_metering_1,type = "l",xlab = " ",ylab = "Energy sub metering")
lines(Whole_Time,Sub_metering_2,col="Red")
lines(Whole_Time,Sub_metering_3,col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c(1,"Red","Blue"),lty = c(1,1,1),cex = 0.6)

##Copying to PNG file
dev.copy(png, file="plot3.png")
dev.off()