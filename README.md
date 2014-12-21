---
title: "READ ME"
author: "Aravind Sesetty"
date: "Saturday, December 20, 2014"
output: html_document
---
- - -
##Getting and Cleaning Data 
###Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

Data Source: [Human Activity Recognition Using Smartphones ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

Data Set: [FUCI HAR](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   

####R script called `run_analysis.R` does the following. 

######1. Download the \*.zip file and Unzip it
- Check for the `./GACD_CP/data` folder, create if doesnt exists
- Set up a temporary *.zip file namespace in the temp directory
- Download the \*.zip file to `temp` directory and into the temporary \*.zip file namespace
- Unzip the *.zip file into `./GACD_CP/data` directory

######2. Merges the training and the test sets to create one data set.
- Read `X_train.txt` data into a dataframe
- Read `X_test.txt` data into a dataframe
- Append `X_train.txt` data with `X_test.txt` data by Row
- Read **column 2** of `features.txt` data into a dataframe
- Set `features.txt` data as column names to **X_train_test_Data**

######3. Extracts only the measurements on the mean and standard deviation for each measurement.
- Grep `features.txt` data for **mean** & **std** columns indexes
- Subset **X_train_test_Data** by **mean_std_Index**

######4. Merges the Subject training and the Subject test sets to create one data set.
- Read `subject_train.txt` data into a dataframe
- Read `subject_test.txt` data into a dataframe
- Append `subject_train.txt` Data & `subject_test.txt` Data and column bind to **X_train_test_mean_std_Data**

######5. Uses descriptive activity names to name the activities in the data set
- Read `y_train.txt` data into a dataframe
- Read `y_test.txt` data into a dataframe
- Append `y_train.txt` Data & `y_test.txt` Data by row
- Read **column 2** of `features.txt` data into a dataframe
- Apply **Activity Labels** to **y_train_test_Data**
- Set column name as **Activity** to **y_train_test_Data**
- Column bind the **X_train_test_mean_std_Data** & **y_train_test_Data**

######6. Appropriately labels the data set with descriptive variable names. 
- Fetch the **Raw Headings**
- Modify the **Raw Headings** to **Meaningful Headings**
- Set the **Meaningful Headings** to **finalData**

######7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Apply **Mean** function and **Aggregate** data by **Activity** & **Volunteer**
- Write `tidyData.txt` to a txt file