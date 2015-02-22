## Introduction

The assignment is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Submission includes: 
1) a tidy data set as described below, 
2) a link to my Github repository that includes:
     A) run_analysis.R - the script for performing the analysis, see details below
     B) CodeBook.md - a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.
     C) README.md - explains the project, the data, and the run_analysis.R script.  

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It assusmed that the project data is stored locally in your working directory in the folder "UCI HAR Dataset".

"run_analysis.R" performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The detailed steps as defined in the run_analysis.R file include:

## run_analysis.R
## This script does the following activities necessary to create the tidy data set:
##   1) Reads in the measurement files 
##          ./UCI HAR Dataset/test/X_test.txt
##          ./UCI HAR Dataset/train/X_train.txt
##   2) Combines the measurement files X_train and X_test using rbind()
##      There are 561 measurement types and 10,299 observations.
##   3) Reads in the features file that describes each measurement
##          ./UCI HAR Dataset/features.txt
##   4) Assigns column names using the features.txt file    
##   5) Extracts only the columns with measurements that were 
##        calculated for the mean and standarad deviation of the data  
##        This was determined by selecting only column names that contained
##        "mean" or "std" as part of their description.
##      There are 79 measurement types that fit this criteria.
##   6) Reads in the subject information files
##          ./UCI HAR Dataset/test/subject_test.txt
##          ./UCI HAR Dataset/train/subject_train.txt
##   7) Combines the subject information files subject_train and subject_test using rbind()        
##   8) Define the column name to the subject information as "Subject"
##   9) Reads in the activities files describing the activity for each measurement
##          ./UCI HAR Dataset/test/y_test.txt
##          ./UCI HAR Dataset/train/y_train.txt
##   10) Combines the activities files y_train and y_test using rbind()        
##   11) Define the column name to the activity information as "Activity"
##   12) Transform the activity numbers to names using the following guide
##        1 -> WALKING
##        2 -> WALKING_UPSTAIRS
##        3 -> WALKING_DOWNSTAIRS
##        4 -> SITTING
##        5 -> STANDING
##        6 -> LAYING
##    13) Correct the column names to ensure there are no illegal characters or type-o
##        A) remove the parentheses characters.
##        B) replace "-" with "_".
##        C) replace "BodyBody" with "Body".
##    14) Associate each measurement with the correct subject and activity using cbind()
##
## The script continues by performing some analysis: 
##    A) Define the data identifiers and variables using melt.
##    B) Determine the average of each measurement grouping by Subject and Activity.
##   
## Output:
##   The resulting analysis file is written to the working directory. 
##   The filename is tidyDataSet.txt
##
## Data: It is expected that the data provided from UCI is unzipped in your working
##     directory.  In other words, the folder "UCI HAR Dataset" should be in your
##     working directory with the all the contained files.
##
## Packages that are needed include: data.table and reshape2 
##
## Viewing Output:
##   To read in the file and View the contents the following commands can be used
##     filename <- "./tidyDataSet.txt"
##     myfile <- data.table(read.table(filename, header = T, stringsAsFactors=FALSE))
##

## Tidy Data is defined as:
 1) Each variable forms a column
 2) Each observation forms a row
 3) Each type of observational unit forms a table

 My checklist to validate tidy data:
 
    1. Does it have headings so I know which columns are which.
    2. Are the variables in different columns (I used a wide form)
    3. Are there no duplicate columns 
 
## Loading the data to perform analysis:
When loading the dataset into R, please consider the following:
1. The files are rather large, and not all of them are necessary for the analysis. 
2. Extract the files from the zip file into the working directory such that the folder "UCI HAR Dataset" is in your working directory.  The script will be able to locate the files with this proper placement.

## Loading the tidy data data set to review the contents:
1. Place the file in your working directory.
2. Use the following commands:
filename <- "./tidyDataSet.txt"
myfile <- data.table(read.table(filename, header = T, stringsAsFactors=FALSE))
3. To display data for review: 
View(myfile) 
 
## Information about experiment conducted to collect the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

