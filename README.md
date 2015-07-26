# Getting-and-Cleaning-Data-Assignment
Assignment for Coursera Data Science Third Course : Getting and Cleaning Data

## Steps to run the Analysis on the Assignment Data

1. Download the data source and the required files from the github link provided below and put into a local folder.
	https://github.com/asrulnb/Getting-and-Cleaning-Data-Assignment
	
2. Open the run_analysis.R file in your Rstudio. 
	- The Rstudio used to create this script is Version 0.99.465
	- The Rstudio runs on a 64bit Windows 8.1 Machine running R version 3.2.1 (2015-06-18)
	
3. When the "run_analysis.R" file is run, it will automatically set the working directory to where the file is located.
	- The source file should exist in the folder where the Raw data "UCI HAR Dataset" is present
	- The script will automatically clear all data and variables in memory when it starts

4. Running source(`run_analysis.R`) will generate a new file `tidy_data.txt` in the working directory.


## Analysis Script Explanation
1. The Script starts by clearing the session of any existing variables and data
2. This script uses "dplyr" and "data.table" library and will load them to memory
3. Part 1 : Merges the training and the test sets to create one data set
	- Read "subject_train.txt", "y_train.txt" and "x_train.txt" from "Training" folder
	- Read "subject_test.txt", "y_test.txt" and "x_test.txt" from "Test" folder
	- Merge "subject_train" and "subject_test" into one data variable "subject"
	- Merge "y_train.txt" and "y_test.txt" data into one variable "label"
	- Merge "x_train.txt" and "x_test.txt" data into one variable "data"
	- Read "UCI HAR Dataset/features.txt" data to use as column name for "data"
	- Use "make.names" function to transform the column name so that we can use dplyr "select" function. (dplyr "select" function does not work with the column name provided in "UCI HAR Dataset/features.txt")
	- Merge "subject","label" and "data" into one "dsMain"
4. Part 2 : Extracts only the measurements on the mean and standard deviation for each measurement
	- Use "dplyr" "select" function to extract "Subject", "Activity", column that have "mean" and "std" in its name
5. Part 3 : Uses descriptive activity names to name the activities in the data set
	- Read data from "UCI HAR Dataset/activity_labels.txt" file to use as descriptive name for the activity
	- Use dplyr "mutate" function to change the integer in "Activity" column with more meaningful name
6. Part 4 : Appropriately labels the data set with descriptive variable names
	- Use "gsub" function to replace the previous column name into more meaningful ones
7. Part 5 : creates a second, independent tidy data set with the average of each variable for each activity and each subject
	- Convert "dsMain" from data.frame to data.table format
	- Use "aggregate" function to calculate the mean for all relevant columns and store it to "tinyData" variable
	- Use "write.table" function to output the "tinyData" variable into "tiny_data.txt" file without the row.names

## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.