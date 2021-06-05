# MechaCar Statistical Analysis Using R

## Linear Regression to Predict MPG
I designed a linear model that predicts the mpg of MechaCar prototypes using several variables including vehicle length, weight, spoiler angle, drivetrain and ground clearance. To create the linear regression, I read the data csv file, used the lm() function to create the linear regression, and used the summary() function to produce the summary statistics.

```
#import libraries
library(dplyr)

#read file
MechaCarData <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

#create linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData)

#create summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData))
```

The script produced the following data:

![Linear Regression MPG](/Resources/linreg_mpg.PNG)

 - The variables that provided a non-random amount of variance to the mpg values in the dataset were "vehicle_length" and "ground_clearance."
 - The p-value (5.35e-11) is much smaller than a significance level of 0.05. This means that the slope of the linear model is not considered to be zero because the statistical analysis provides sufficient evidence that the null hypothesis is not true.
 - The linear model does predict mpg of MechaCar prototypes effectively as the r-squared value is 0.7149. This means that there is about a 71.5% chance that future data will be able to fit this model.

## Summary Statistics on Suspension Coils
![Total Summary](/Resources/totalsummary.PNG)

![Lot Summary](/Resources/lotsummary.PNG)

