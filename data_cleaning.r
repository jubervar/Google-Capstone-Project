library(tidyverse)
library(janitor)
library(skimr)
library(dplyr)

cat("Verification of dailyActivity_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/dailyActivity_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check total distance has values that make sense and integer fields contain only integers
intCols <- c(1L,3L,11L,12L,13L,14L,15L)
for (row in 1:nrow(df0))
{
  if (df0[row,4] > df0[row,5] + df0[row,6])
  {
    cat("Total distance higher than sum of parts! Row: ",row)
  }
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

write.csv(df0,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/dailyData_clean.csv", row.names = TRUE)
rm(df0)

cat("\n####################################################################################################################\n\n")

cat("Verification of heartrate_seconds_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/heartrate_seconds_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Change column name from Time to ActivitySecond and Value to Heartrate
colnames(df0)[2] = "ActivitySecond"
colnames(df0)[3] = "Heartrate"

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

write.csv(df0,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/secondData_clean.csv", row.names = TRUE)
rm(df0)

cat("\n####################################################################################################################\n\n")

cat("Verification of hourlyCalories_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/hourlyCalories_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Verification of hourlyIntensities_merged.csv data\n\n")
df1 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/hourlyIntensities_merged.csv")

#Remove any possible duplicate rows
df1 <- distinct(df1)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df1))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df1))
{
  for (col in intCols)
  {
    if (df1[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Verification of hourlySteps_merged.csv data\n\n")
df2 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/hourlySteps_merged.csv")

#Remove any possible duplicate rows
df2 <- distinct(df2)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df2))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df2))
{
  for (col in intCols)
  {
    if (df2[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Aggregation of hourly data data\n\n")

df0 <- unite(df0,primaryKey,c("Id","ActivityHour"),sep="")
df1 <- unite(df1,primaryKey,c("Id","ActivityHour"),sep="")
df2 <- unite(df2,primaryKey,c("Id","ActivityHour"),sep="")

df0 <- merge(x=df0,y=df1)
rm(df1)
df_byHour <- merge(x=df0,y=df2)
rm(df2)
rm(df0)

write.csv(df_byHour,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/hourData_clean.csv", row.names = TRUE)
rm(df_byHour)

cat("\n####################################################################################################################\n\n")

cat("Verification of minuteSleep_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteSleep_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Change column name from date to ActivityMinute, value to SleepValue and logId to LogId
colnames(df0)[2] = "ActivityMinute"
colnames(df0)[3] = "SleepValue"
colnames(df0)[4] = "LogId"

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

write.csv(df0,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteSleep_clean.csv", row.names = TRUE)
rm(df0)

cat("\n####################################################################################################################\n\n")

cat("Verification of sleepDay_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/sleepDay_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Change column name from SleepDay to ActivityDate for uniformity
colnames(df0)[2] = "ActivityDate"

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L,3L,4L,5L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

write.csv(df0,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/dailySleep_clean.csv", row.names = TRUE)
rm(df0)

cat("\n####################################################################################################################\n\n")

cat("Verification of weightLogInfo_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/weightLogInfo_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Change column name from Date to ActivityDate for uniformity
colnames(df0)[2] = "ActivityDate"

#Drop Fat column since most of it is missing values
df0 <- select(df0,-Fat)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L,7L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

write.csv(df0,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/dailyWeight_clean.csv", row.names = TRUE)
rm(df0)

cat("\n####################################################################################################################\n\n")

cat("Verification of minuteCaloriesNarrow_merged.csv data\n\n")
df0 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteCaloriesNarrow_merged.csv")

#Remove any possible duplicate rows
df0 <- distinct(df0)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df0))

#Check integer fields contain only integers
intCols <- c(1L)
for (row in 1:nrow(df0))
{
  for (col in intCols)
  {
    if (df0[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Verification of minuteIntensitiesNarrow_merged.csv data\n\n")
df1 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteIntensitiesNarrow_merged.csv")

#Remove any possible duplicate rows
df1 <- distinct(df1)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df1))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df1))
{
  for (col in intCols)
  {
    if (df1[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Verification of minuteStepsNarrow_merged.csv data\n\n")
df2 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteStepsNarrow_merged.csv")

#Remove any possible duplicate rows
df2 <- distinct(df2)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df2))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df2))
{
  for (col in intCols)
  {
    if (df2[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Verification of minuteMETsNarrow_merged.csv data\n\n")
df3 <- read_csv("C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteMETsNarrow_merged.csv")

#Remove any possible duplicate rows
df3 <- distinct(df3)

#Manually verify data types and column names, and check for null data and basic statistics
print(skim_without_charts(df3))

#Check integer fields contain only integers
intCols <- c(1L,3L)
for (row in 1:nrow(df3))
{
  for (col in intCols)
  {
    if (df3[row,col] %% 1 != 0)
    {
      cat("Non-integer value on integer field! Row: ",row)
    }
  }
}

cat("\n####################################################################################################################\n\n")

cat("Aggregation of minute data\n\n")

df0 <- unite(df0,primaryKey,c("Id","ActivityMinute"),sep="")
df1 <- unite(df1,primaryKey,c("Id","ActivityMinute"),sep="")
df2 <- unite(df2,primaryKey,c("Id","ActivityMinute"),sep="")
df3 <- unite(df3,primaryKey,c("Id","ActivityMinute"),sep="")

df0 <- merge(x=df0,y=df1)
rm(df1)
df0 <- merge(x=df0,y=df2)
rm(df2)
df_byMinute <- merge(x=df0,y=df3)
rm(df3)
rm(df0)

write.csv(df_byMinute,"C:/Users/jjber/Desktop/Google_Case_Study/FitabaseData/minuteData_clean.csv", row.names = TRUE)