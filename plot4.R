##Reading in the data to R
Data<-read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(Data)<-c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Creating vectors with the Sub_metering, Voltage, Global Reactive Power, and Global Active Power data

Global_Active_Power<-NULL
for(i in 1:nrow(Data)) {
      Global_Active_Power[i]<-Data[i,3]
}

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

Voltage<-NULL
for(i in 1:nrow(Data)) {
      Voltage[i]<-Data[i,5]
}

Global_Reactive_Power<-NULL
for(i in 1:nrow(Data)) {
      Global_Reactive_Power[i]<-Data[i,4]
}

##Converting the character dates and times to POSIXlt and POSIXt dates and times

Data[ ,10]<-paste(Data[ ,1],Data[ ,2], sep = " ")
Whole_Time<-strptime(Data[ ,10], format = "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))
plot(Whole_Time,Global_Active_Power, type = "l", xlab = " ", ylab = "Global Active Power",cex.lab=.75)
plot(Whole_Time,Sub_metering_1,type = "l",xlab = " ",ylab = "Energy sub metering",cex.lab=.75)
lines(Whole_Time,Sub_metering_2,col="Red")
lines(Whole_Time,Sub_metering_3,col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c(1,"Red","Blue"),lty = c(1,1,1),cex = 0.5,bty = "n",y.intersp = .75,xjust = 1)
plot(Whole_Time,Voltage, xlab="datetime",ylab="Voltage",type = "l",cex.lab=.75)
plot(Whole_Time,Global_Reactive_Power,xlab="datetime",ylab="Global_Reactive_Power",type="l",cex.lab=.75)

##Copying to PNG file
dev.copy(png, file="plot4.png")
dev.off()