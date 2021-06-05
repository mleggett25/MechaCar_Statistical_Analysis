# MechaCar Statistical Analysis Using R

## Linear Regression to Predict MPG
I designed a linear model that predicts the mpg of MechaCar prototypes using several variables including vehicle length, weight, spoiler angle, drivetrain and ground clearance. To create the linear regression, I read the data csv file, used the lm() function to create the linear regression, and used the summary() function to produce the summary statistics.

```
library(dplyr)

MechaCarData <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData))
```

The script produced the following data:

![Linear Regression MPG](/Resources/linreg_mpg.PNG)

 - The variables that provided a non-random amount of variance to the mpg values in the dataset were "vehicle_length" and "ground_clearance."
 - The p-value (5.35e-11) is much smaller than a significance level of 0.05. This means that the slope of the linear model is not considered to be zero because the statistical analysis provides sufficient evidence that the null hypothesis is not true.
 - The linear model does predict mpg of MechaCar prototypes effectively as the r-squared value is 0.7149. This means that there is about a 71.5% chance that future data will be able to fit this model.

## Summary Statistics on Suspension Coils
Using the dataset on suspension coils, I created a summary statistics table showing the suspension coil's PSI continuous variable across all manufacturing lots and the PSI metrics for each lot. To accomplish this, I first read the data csv file, created the summary table for all the manufacturing lots (the total_summary table), and then grouped the table by the manufacturing lot to produce the table for each lot (the lot_summary table).

```
SuspensionData <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

total_summary <- SuspensionData %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

lot_summary <- SuspensionData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
```

The script produced the following tables:

Total Summary Statistics

![Total Summary](/Resources/totalsummary.PNG)

Per Lot Summary Statistics

![Lot Summary](/Resources/lotsummary.PNG)

The design specifications for the MechaCar suspension coils dictated that the variance of the suspension coils must not exceed 100 pounds per square inch. Based on these specifications, the current manufacturing data does meet the criteria for all the lots in total as the variance is 62.29. Individually, Lots 1 and 2 meet the specifications with variances of 0.98 and 7.47 respectively, but Lot 3 has a variance of 170.29 which well exceeds the maximum of 100 pounds per square inch.

## T-Tests on Suspension Coils
I performed t-tests to determine if all manufacturing lots and each lot individually was statistically different from the population mean of 1,500 pounds per square inch.

```
#t-test for all manufacturing lots
t.test(SuspensionData$PSI, mu=1500)

#t-test for lot 1
t.test(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot 1", mu=1500)
#t-test for lot 2
t.test(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot 2", mu=1500)
#t-test for lot 3
t.test(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot 3", mu=1500)
```

