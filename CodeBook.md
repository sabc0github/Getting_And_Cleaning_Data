---
title: "CodeBook"
author: "Aravind Sesetty"
date: "Saturday, December 20, 2014"
output: html_document
---
- - -
##Human Activity Recognition Using Smartphones Data Set 
###Abstract
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
        
####Actual Data Source
A full description is available at the site where the data was obtained: 

Dataset: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

Zip file: [FUCI HAR ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


The experiments have been carried out with a group of **30 volunteers** within an age bracket of 19-48 years. 

Each person performed below six activities wearing a smartphone ( *Samsung Galaxy S II* ) on the waist. 

        1.	WALKING, 
        2.	WALKING_UPSTAIRS, 
        3.	WALKING_DOWNSTAIRS, 
        4.	SITTING, 
        5.	STANDING, 
        6.	LAYING

Embedded accelerometer and gyroscope captured **3-axial linear acceleration** and **3-axial angular velocity** at a constant rate of 50Hz. 

The obtained dataset has been randomly partitioned into two sets, where **70%** of the volunteers was selected for generating the **training data** and **30%** the **test data**. 

The sensor signals ( **accelerometer** and **gyroscope**) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

####Feature Selection 

These signals were used to estimate variables of the feature vector for each pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

        mean(): Mean value
        std(): Standard deviation

####The dataset includes the following files

- train/X_train.txt             :Training set.
- test/X_test.txt               : Test set.
- features.txt                  : List of all features.
- train/subject_train.txt       : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- test/subject_test.txt         : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- train/y_train.txt             : Training labels.
- test/y_test.txt               : Test labels.
- activity_labels.txt           : Links the class labels with their activity name.

####Target Data Files Description
        tidyData.txt: (data.frame, 180 obs. of 68 variables)

1.	Activity: Factor w/ 6 levels
        WALKING, 
        WALKING_UPSTAIRS, 
        WALKING_DOWNSTAIRS, 
        SITTING, 
        STANDING, 
        LAYING
2.	Volunteer: Factor w/ 30 level
        1:30
3.	TimeBodyAccelerometer-mean(): num-X: num
4.	TimeBodyAccelerometer-mean(): num-Y: num
5.	TimeBodyAccelerometer-mean(): num-Z: num
6.	TimeBodyAccelerometer-mean(): num-X: num
7.	TimeBodyAccelerometer-mean(): num-Y: num
8.	TimeBodyAccelerometer-mean(): num-Z: num
9.	TimeGravityAccelerometer-mean(): num-X: num        
10.	TimeGravityAccelerometer-mean(): num-Y: num 
11.	TimeGravityAccelerometer-mean(): num-Z: num
12.	TimeGravityAccelerometer-mean(): num-X: num            
13.	TimeGravityAccelerometer-mean(): num-Y: num 
14.	TimeGravityAccelerometer-mean(): num-Z: num
15.	TimeBodyAccelerometerJerk-mean(): num-X: num          
16.	TimeBodyAccelerometerJerk-mean(): num-Y: num
17.	TimeBodyAccelerometerJerk-mean(): num-Z: num
18.	TimeBodyAccelerometerJerk-mean(): num-X: num           
19.	TimeBodyAccelerometerJerk-mean(): num-Y: num
20.	TimeBodyAccelerometerJerk-mean(): num-Z: num           
21.	TimeBodyGyroscope-mean(): num-X: num    
22.	TimeBodyGyroscope-mean(): num-Y: num    
23.	TimeBodyGyroscope-mean(): num-Z: num    
24.	TimeBodyGyroscope-mean(): num-X: num     
25.	TimeBodyGyroscope-mean(): num-Y: num     
26.	TimeBodyGyroscope-mean(): num-Z: num     
27.	TimeBodyGyroscopeJerk-mean(): num-X: num
28.	TimeBodyGyroscopeJerk-mean(): num-Y: num
29.	TimeBodyGyroscopeJerk-mean(): num-Z: num
30.	TimeBodyGyroscopeJerk-mean(): num-X: num 
31.	TimeBodyGyroscopeJerk-mean(): num-Y: num 
32.	TimeBodyGyroscopeJerk-mean(): num-Z: num 
33.	TimeBodyAccelerometerMag-mean(): num             
34.	TimeBodyAccelerometerMag-mean(): num
35.	TimeGravityAccelerometerMag-mean(): num          
36.	TimeGravityAccelerometerMag-mean(): num           
37.	TimeBodyAccelerometerJerkMag-mean(): num         
38.	TimeBodyAccelerometerJerkMag-mean(): num          
39.	TimeBodyGyroscopeMag-mean(): num   
40.	TimeBodyGyroscopeMag-mean(): num    
41.	TimeBodyGyroscopeJerkMag-mean(): num             
42.	TimeBodyGyroscopeJerkMag-mean(): num
43.	FrequencyBodyAccelerometer-mean(): num-X: num         
44.	FrequencyBodyAccelerometer-mean(): num-Y: num         
45.	FrequencyBodyAccelerometer-mean(): num-Z: num         
46.	FrequencyBodyAccelerometer-mean(): num-X: num          
47.	FrequencyBodyAccelerometer-mean(): num-Y: num          
48.	FrequencyBodyAccelerometer-mean(): num-Z: num          
49.	FrequencyBodyAccelerometerJerk-mean(): num-X: num     
50.	FrequencyBodyAccelerometerJerk-mean(): num-Y: num     
51.	FrequencyBodyAccelerometerJerk-mean(): num-Z: num     
52.	FrequencyBodyAccelerometerJerk-mean(): num-X: num      
53.	FrequencyBodyAccelerometerJerk-mean(): num-Y: num      
54.	FrequencyBodyAccelerometerJerk-mean(): num-Z: num      
55.	FrequencyBodyGyroscope-mean(): num-X: num             
56.	FrequencyBodyGyroscope-mean(): num-Y: num             
57.	FrequencyBodyGyroscope-mean(): num-Z: num             
58.	FrequencyBodyGyroscope-mean(): num-X: num
59.	FrequencyBodyGyroscope-mean(): num-Y: num
60.	FrequencyBodyGyroscope-mean(): num-Z: num
61.	FrequencyBodyAccelerometerMag-mean(): num        
62.	FrequencyBodyAccelerometerMag-mean(): num         
63.	FrequencyBodyBodyAccelerometerJerkMag-mean(): num
64.	FrequencyBodyBodyAccelerometerJerkMag-mean(): num 
65.	FrequencyBodyBodyGyroscopeMag-mean(): num        
66.	FrequencyBodyBodyGyroscopeMag-mean(): num         
67.	FrequencyBodyBodyGyroscopeJerkMag-mean(): num    
68.	FrequencyBodyBodyGyroscopeJerkMag-mean(): num  


