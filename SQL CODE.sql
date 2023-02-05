                       /*EXAMINING AND CLEANING BELLABEAT CASE STUDY DATA*/

/*Selecting unique participants in the dailyActivity table*/
SELECT DISTINCT Id
FROM [Portfolio project ].dbo.dailyActivity;
/*33 unique Id's reported*/


/*Selecting unique Id's in the sleepDay table*/
SELECT DISTINCT Id
FROM [Portfolio project ].dbo.sleepDay;
/*24 unique Id's reported*/


/*Selecting unique Id's in the weightLog table*/
SELECT DISTINCT Id
FROM [Portfolio project ].dbo.weightLog;
/*8 unique Id's reported*/


/*Determining start and end date of data provided in dailyActivity table*/
SELECT MIN(ActivityDate) AS startdate, MAX(ActivityDate) AS enddate
FROM [Portfolio project ].dbo.dailyActivity;
/*Start date 2016-4-12, end date 2016-5-1*/


/*Determining start and end date of data provided in sleepday table*/
SELECT MIN(SleepDay) AS startdate, MAX(SleepDay) AS enddate
FROM [Portfolio project ].dbo.sleepDay;
/*Startdate 2016-4-12 , enddate 2016-5-1*/


/*Determining start and end date of data tracked in WeightLog table*/
SELECT MIN(Date) AS startDate, MAX(Date) AS endDate
FROM [Portfolio project ].dbo.weightLog;
/*Start date 2016-4-12, end date 2016-5-12*/


SELECT Id, ActivityDate,Calories, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance, SedentaryActiveDistance, (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS TotalActiveMinutes, SedentaryMinutes
FROM [Portfolio project ].dbo.dailyActivity;


/*Left join all 3 tables*/
SELECT *
FROM [Portfolio project ].dbo.dailyActivity AS d 
LEFT JOIN [Portfolio project ].dbo.sleepDay AS s
ON d.ActivityDate = s.SleepDay AND d.Id = s.Id
LEFT JOIN [Portfolio project ].dbo.weightLog AS w
ON s.SleepDay = w.Date AND s.Id = w.Id
ORDER BY d.Id, Date;


/*Outer join daily Activity and sleepDay tabel*/
SELECT activity.Id, ActivityDate,Calories, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance, SedentaryActiveDistance, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes
FROM [Portfolio project ].dbo.dailyActivity AS activity
FULL OUTER JOIN  [Portfolio project ].dbo.sleepDay AS sleep
ON activity.Id = sleep.Id AND activity.ActivityDate = sleep.SleepDay;

















