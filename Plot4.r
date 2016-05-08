if(is.element("Plotdata.rda", list.files())){
  load(file="Plotdata.rda")} else{
    a= read.delim("household_power_consumption.txt", header = T, sep = ";",stringsAsFactors = F)
    D = as.Date(a[,1],"%d/%m/%Y")
    T = strptime(paste(a[,1],a[,2]),"%d/%m/%Y %H:%M:%S")
    b = a[,3:ncol(a)]
    for ( i in 1:ncol(b)){b[,i] = as.numeric(b[,i])}
    B = cbind(D,T,b)
    C = B[which(B$D>="2007-02-01"&B$D<="2007-02-02"),]
    remove(a,D,T,b,B)  
    write(C, file = "Plotdata.rda")
  }
par(mfrow=c(2,2))
plot(x=C$T,y=C$Global_active_power, pch = "",ylab = "Global Active Power(KW)",xlab = "datetime", main="")
lines(x=C$T,y=C$Global_active_power)
plot(x=C$T,y=C$Voltage, pch = "",ylab = "Voltage",xlab = "datetime", main = "")
lines(x=C$T,y=C$Voltage)
plot(x= C$T, y = C$Sub_metering_1, main= "",pch="",ylab = "Energy Submetering",xlab = "datetime")
lines(x=C$T, y=C$Sub_metering_1, col= "black")
lines(x=C$T, y=C$Sub_metering_2, col= "red")
lines(x=C$T, y=C$Sub_metering_3, col= "blue")
plot(x=C$T,y=C$Global_reactive_power,main= "",pch="",xlab="datetime", ylab = "Global Reactive Power(KW)")
lines(x=C$T,y=C$Global_reactive_power)
dev.copy(png,'plot4.png')
dev.off()
dev.off()
