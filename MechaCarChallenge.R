#import libraries
library(dplyr)

#read file
MechaCarData <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

#create linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData)

#create summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData))


#read file
SuspensionData <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

#create summary table
total_summary <- SuspensionData %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#create summary table grouped by lot
lot_summary <- SuspensionData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')