#Read the csv file and give its name as mvt
mvt = read.csv(choose.files())
#Find max and min value in ID variable 
max(mvt$ID)
min(mvt$Beat)
#Use the table function for arrest variable
table(mvt$Arrest)
#Use the table function for LocationDescription variable with condition as "ALLEY"
table(mvt$LocationDescription == "ALLEY")
ls(mvt)
str(mvt$Date)
mvt$Date[1]
#Convert the characters into Data object
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
DateConvert
median(DateConvert)
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert
table(mvt$Month)
table(mvt$Weekday)
table(mvt$Arrest,mvt$Month)
hist(mvt$Date, breaks=100)
boxplot(mvt$Date ~ mvt$Arrest)
table(mvt$Arrest,mvt$Year)
sort(table(mvt$LocationDescription))
Top5 = subset(mvt, LocationDescription=="STREET" | LocationDescription=="PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription=="ALLEY" | LocationDescription=="GAS STATION" | LocationDescription=="DRIVEWAY - RESIDENTIAL")
or
TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)", "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")
Top5 = subset(mvt, LocationDescription %in% TopLocations)
Top5$LocationDescription = factor(Top5$LocationDescription)
str(Top5)
table(Top5$LocationDescription)
table(Top5$LocationDescription, Top5$Arrest)
table(Top5$LocationDescription, Top5$Weekday)
