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
##___________________________________________________________________________
##
## run_analysis.R
##
library(data.table)
##
##   1) Reads in the measurement files 
##
filename <- "./UCI HAR Dataset/test/X_test.txt"
dt_X_test <- data.table(read.table(filename, stringsAsFactors=FALSE))
filename <- "./UCI HAR Dataset/train/X_train.txt"
dt_X_train <- data.table(read.table(filename, stringsAsFactors=FALSE))
##
##   2) Combines the measurement files X_train and X_test using rbind()
##
dt_X <- rbind(dt_X_train, dt_X_test)
##
##   3) Reads in the features file that describes each measurement
##
filename <- "./UCI HAR Dataset/features.txt"
dt_features <- data.table(read.table(filename, stringsAsFactors=FALSE))
## 
##   4) Assigns column names using the features.txt file    
##
setnames(dt_X, dt_features[,V2])
##
##   5) Extracts only the columns with measurements that were 
##        calculated for the mean and standarad deviation of the data  
##        This was determined by selecting only column names that contained
##        "mean" or "std" as part of their description.
##      There are 79 measurement types that fit this criteria.
##
##      Note, by including "with=F", this allows for the command to work
##            like a data.table and pull the column information
##
dt_X_mean <- dt_X[,grep("mean",colnames(dt_X)), with=F]
dt_X_std <- dt_X[,grep("std",colnames(dt_X)), with=F]
dt_X_mean_std <- cbind(dt_X_mean,dt_X_std)
## 
##   6) Reads in the subject information files
## 
filename <- "./UCI HAR Dataset/test/subject_test.txt"
dt_subject_test <- data.table(read.table(filename, stringsAsFactors=FALSE))
filename <- "./UCI HAR Dataset/train/subject_train.txt"
dt_subject_train <- data.table(read.table(filename, stringsAsFactors=FALSE))
##
##   7) Combines the subject information files subject_train and subject_test using rbind()        
##
dt_subject <- rbind(dt_subject_train, dt_subject_test)
##
##   8) Define the column name to the subject information as "Subject"
##
setnames(dt_subject, c("Subject"))
##
##   9) Reads in the activities files describing the activity for each measurement
## 
filename <- "./UCI HAR Dataset/test/y_test.txt"
dt_y_test <- data.table(read.table(filename, stringsAsFactors=FALSE))
filename <- "./UCI HAR Dataset/train/y_train.txt"
dt_y_train <- data.table(read.table(filename, stringsAsFactors=FALSE))
##
##   10) Combines the activities files y_train and y_test using rbind()        
##
dt_y <- rbind(dt_y_train, dt_y_test)
##
##   11) Define the column name to the activity information as "Activity"
##
setnames(dt_y, c("Activity"))
##
##   12) Transform the activity numbers to names 
##
dt_y$Activity[dt_y$Activity == "1"] <- "WALKING"
dt_y$Activity[dt_y$Activity == "2"] <- "WALKING_UPSTAIRS"
dt_y$Activity[dt_y$Activity == "3"] <- "WALKING_DOWNSTAIRS"
dt_y$Activity[dt_y$Activity == "4"] <- "SITTING"
dt_y$Activity[dt_y$Activity == "5"] <- "STANDING"
dt_y$Activity[dt_y$Activity == "6"] <- "LAYING"
##
##    13) Correct the column names to ensure there are no illegal characters or type-o
##        A) remove the parentheses characters.
##        B) replace "-" with "_".
##        C) replace "BodyBody" with "Body".
##
colnames_working <- colnames(dt_X_mean_std)
colnames_working <- gsub("[(]","",colnames_working)
colnames_working <- gsub("[)]","",colnames_working)
colnames_working <- gsub("-","_",colnames_working)
colnames_working <- gsub("BodyBody","Body",colnames_working)
setnames(dt_X_mean_std, colnames_working)
##
##    14) Associate each measurement with the correct subject and activity using cbind()
## 
dt_dataset <- cbind(dt_X_mean_std, dt_subject, dt_y)
##
##  The data set is now "tidy".  
##     There 81 columns: 79 variables, and two identifiers (Subject, Activity)
##     There are 10,299 seperate observations
##
##  Moving on to a bit of analsyis.
##
library(reshape2)
##
##    A) Define the data identifiers and variables using melt.
##
dataMelt <- melt(dt_dataset,id=c("Subject","Activity"),measure.vars=1:79)
##
##    B) Determine the average of each measurement grouping by Subject and Activity.
##
Activitydata_tidy <- dcast(dataMelt, Activity + Subject ~ variable,mean)
##
##  Write the resulting analyzed file to the working directory.
##  Filename: tidyDataSet.txt
##
write.table(Activitydata_tidy, file='./tidyDataSet.txt',row.names=F, sep='\t', quote=F)
##
##  To read in the file and View the contents the following commands can be used:
##     filename <- "./tidyDataSet.txt"
##     myfile <- data.table(read.table(filename, header = T, stringsAsFactors=FALSE))