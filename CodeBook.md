CodeBook / Data Dictionary - Getting and Cleaning Data Project

Activity - The type of activity performed by the subject when the measurements were taken.  The data was transformed from integer values 1-6 representing each activity to the string values below.

      WALKING
      WALKING_UPSTAIRS
      WALKING_DOWNSTAIRS
      SITTING
      STANDING
      LAYING

Subject - An integer value representing one of 30 subjects/participants included in the data.  No data transformation was performed.

      1..30

Next 79 data elements - Calculated Values
      The average of each of the 79 measurement types grouped by Activity and Subject.  Measurement types include the Mean or Standard Deviation calculated from the captured data for either time or frequency domain variable. 

      't' or 'f'          - time or frequency domain
      'Body' or 'Gravity' - Indicating body or gravity acceleration.
      'Acc'               - Acceleration
      'Jerk'              - the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (AccJerk, and GyroJerk)
      'Gyro', 'Mag'       - the magnitude of the three-dimensional signals were calculated using the Euclidean norm (AccMag, AccJerkMag, GyroMag, GyroJerkMag)
      'mean'              - calculated mean value
      'std'               - calculated standard deviation
      'X' or 'Y' or 'Z'   - denotes 3-axial signals in the X, Y and Z directions

tBodyAcc_mean_X
tBodyAcc_mean_Y
tBodyAcc_mean_Z
tGravityAcc_mean_X
tGravityAcc_mean_Y
tGravityAcc_mean_Z
tBodyAccJerk_mean_X
tBodyAccJerk_mean_Y
tBodyAccJerk_mean_Z
tBodyGyro_mean_X
tBodyGyro_mean_Y
tBodyGyro_mean_Z
tBodyGyroJerk_mean_X
tBodyGyroJerk_mean_Y
tBodyGyroJerk_mean_Z
tBodyAccMag_mean
tGravityAccMag_mean
tBodyAccJerkMag_mean
tBodyGyroMag_mean
tBodyGyroJerkMag_mean
fBodyAcc_mean_X
fBodyAcc_mean_Y
fBodyAcc_mean_Z
fBodyAcc_meanFreq_X
fBodyAcc_meanFreq_Y
fBodyAcc_meanFreq_Z
fBodyAccJerk_mean_X
fBodyAccJerk_mean_Y
fBodyAccJerk_mean_Z
fBodyAccJerk_meanFreq_X
fBodyAccJerk_meanFreq_Y
fBodyAccJerk_meanFreq_Z
fBodyGyro_mean_X
fBodyGyro_mean_Y
fBodyGyro_mean_Z
fBodyGyro_meanFreq_X
fBodyGyro_meanFreq_Y
fBodyGyro_meanFreq_Z
fBodyAccMag_mean
fBodyAccMag_meanFreq
fBodyAccJerkMag_mean
fBodyAccJerkMag_meanFreq
fBodyGyroMag_mean
fBodyGyroMag_meanFreq
fBodyGyroJerkMag_mean
fBodyGyroJerkMag_meanFreq
tBodyAcc_std_X
tBodyAcc_std_Y
tBodyAcc_std_Z
tGravityAcc_std_X
tGravityAcc_std_Y
tGravityAcc_std_Z
tBodyAccJerk_std_X
tBodyAccJerk_std_Y
tBodyAccJerk_std_Z
tBodyGyro_std_X
tBodyGyro_std_Y
tBodyGyro_std_Z
tBodyGyroJerk_std_X
tBodyGyroJerk_std_Y
tBodyGyroJerk_std_Z
tBodyAccMag_std
tGravityAccMag_std
tBodyAccJerkMag_std
tBodyGyroMag_std
tBodyGyroJerkMag_std
fBodyAcc_std_X
fBodyAcc_std_Y
fBodyAcc_std_Z
fBodyAccJerk_std_X
fBodyAccJerk_std_Y
fBodyAccJerk_std_Z
fBodyGyro_std_X
fBodyGyro_std_Y
fBodyGyro_std_Z
fBodyAccMag_std
fBodyAccJerkMag_std
fBodyGyroMag_std
fBodyGyroJerkMag_std
