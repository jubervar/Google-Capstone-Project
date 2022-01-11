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

* Analyze heartrate across the day to determine at what time are bellabeat customers more active. Could do a similar analysis for METs across the day. **Done**
* From the average total distance compare what portion is from logged activities and what is from regular tracking. **Done**
* Compare average distances and times spent in each level of activity (very active, moderate, light, sedentary). **Done**
* Define what average calories burned per day is and what range a normal day covers. Based on this generalized data one could congratulate users when they are able to burn an overly high amount of calories, or send little reminders to exercise on the following days for users that burn an abnormally low number of calories. Of course this last function should only notify the user for a few days and not be constant so it doesn't create unhealthy pressure. **Done**
* Compare the total time in bed and how users spend this time depending on the total number of sleeping records. **Done**
* Calculate how often do users record two or more major sleeping records. If big enough this could motivate the company to create ads that showcase the device's capabilities of helping the user control his sleeping schedule. **Done**
* Compare average calories burned across the week for a specific user. On a user-level you could identify typical days of lower calory burning and send him reminders to exercise and move more. **Done**
* Do a similar analysis from before but for heartrate. On a user-level you could identify these prolonged times of low acivity, not asleep, and remind the user to keep moving. **Under construction**
* Study the average time at which people tend to involve in the different levels of intensity (sedentary, light, moderate, very active). **Done**
* Study how sleep values change throughout sleeping cycles. **Under construction**
* Analyze if average sleep value changes significantly depending on the total sleep records of the day. **Under construction**

## Conclusions

* Users spend most of their time in a sedentary state, with less than 25% of their time in any kind of serious activity that could range from walking to a full-on workout. Out of that portion of the day they are active, it's mostly spent on the lightly active stage (e.g. walking).
* Major part of distances recorded by users are tracked automatically by the smart device, not logged manually. This could be interpreted as that the distances traveled by users just walking on their day to day is much more significant than what they travel on portions of the day specifically focused on exercise. This enhances the importance of day-to-day casual movement in overall health. Users rely a lot on this type of indirect exercise.
* Users' heartrate, METs and level of intensity across the day all behave similarly, showing a drop around the night hours where subjects tend to sleep and two peaks at around 1pm and 8 pm, separated by a slight drop between the two.
* Users that rely on two major sleeping periods tend to spend more time in bed, this extra portion of time spent primarily asleep.
* It would seem at first sight that, around people, there is no agreed upon day of the week for being more active. However, one must take into accout that most people burn an around 1800 calories per day for maintaining vital functions (so no activity involved). Taking this into account the variations between days become more significant and we can conclude that Tuesdays and Saturdays are the days where higher calory expenditure happens (so these are the most active days for most users).
