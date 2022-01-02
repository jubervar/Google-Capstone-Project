# Bellabeat Case Study
Capstone project for the Google Data Analytics Professional Certificate. Bellabeat is a company dedicated to the design and manufacturing of health-focused products for women. The case study looks to identify customer trends in the use of one of Bellabeat's smart devices in order to produce useful recommendations for guiding their future marketing strategies.
Last updated: 12/27/2021

## Data Sources

Data was generated through Amazon Mechanical Turk, a crowd-sourcing service. This means the data comes from individuals who are not organic users of Bellabeat products but instead were paid to test these products and record the required data, which could lead to some bias that must be taken into account. The users provided personal tracker data including minute-level output for physical activity, heart rate, and sleep monitoring. Unique keys can be generated for each entry by considering both user id and time stamp. The data covers the 03.12.2016-05.12.2016 time period, making it outdated for current use but still useful as an analysis exercise. The dataset was shared for open-access on the widely recognized website *Zenodo*.

## Data Cleaning and Manipulation

Data files were too large for manipulation in Excel. Data cleaning and manipulation was thus performed using the R language. The data cleaning and manipulation efforts included the following:
* Search for null or missing data
* Removal of duplicates if any
* Change of variable labels to more comprehensive ones
* Verifying that data makes sense considering business logic
* Aggregation of data

For code see [here](https://github.com/jubervar/Google-Capstone-Project/blob/master/data_cleaning.r).

## Ideas for Analysis

* Analyze heartrate accross the day to determine at what time are bellabeat customers more active. Could do a similar analysis for intensity across the day, and also for METs.
* From the average total distance compare what portion is from logged activities and what is from regular tracking.
* Compare average distances and times spent in each level of activity (very active, moderate, light, sedentary).
* Study how sleep values change throughout sleeping cycles.
* Analyze if average sleep value changes significantly depending on the total sleep records of the day.
* Compare average calories burned across the week. You could identify days of lowest calory burning. On a user-level you could identify typical days of lower calory burning and send him reminders to exercise and move more.
