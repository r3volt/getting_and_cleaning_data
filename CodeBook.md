# Course Project Code Book

This is the codebook for the project. 

For details on the approach used to generate the final "tidy" data set, please see the [Approach Outline](README.md#appraoch-outline).

The final output file should be 15480 Rows and 4 columns. Each row represents the mean of each measure by subject and activity.

## Output File Variables

* *subject* is an integer from 1 to 30 indicating the test subject responsible for collecting the data
* *activity* is a factor variable to indicate the state the subject was in during the data collection. States are as follows:
  * walking
  * walking_upstairs
  * walking_downstairs
  * sitting
  * standing
  * laying
* *measure* is a factor variable indicating the data we are summarizing (using mean) in the *mean* column. Values for measure are as follows (information on how these map to the original data sets below): 
  * time_body_accelerometer_mean_X
  * time_body_accelerometer_mean_Y
  * time_body_accelerometer_mean_Z
  * time_gravity_accelerometer_mean_X
  * time_gravity_accelerometer_mean_Y
  * time_gravity_accelerometer_mean_Z
  * time_body_accelerometer_jerk_mean_X
  * time_body_accelerometer_jerk_mean_Y
  * time_body_accelerometer_jerk_mean_Z
  * time_body_gyrometer_mean_X
  * time_body_gyrometer_mean_Y
  * time_body_gyrometer_mean_Z
  * time_body_gyrometer_jerk_mean_X
  * time_body_gyrometer_jerk_mean_Y
  * time_body_gyrometer_jerk_mean_Z
  * time_body_accelerometer_magnitude_mean
  * time_gravity_accelerometer_magnitude_mean
  * time_body_accelerometer_jerkmagnitide_mean
  * time_body_gyrometer_magnitude_mean
  * time_body_gyrometer_jerkmagnitide_mean
  * frequency_body_accelerometer_mean_X
  * frequency_body_accelerometer_mean_Y
  * frequency_body_accelerometer_mean_Z
  * frequency_body_accelerometer_meanfrequency_X
  * frequency_body_accelerometer_meanfrequency_Y
  * frequency_body_accelerometer_meanfrequency_Z
  * frequency_body_accelerometer_jerk_mean_X
  * frequency_body_accelerometer_jerk_mean_Y
  * frequency_body_accelerometer_jerk_mean_Z
  * frequency_body_accelerometer_jerk_meanfrequency_X
  * frequency_body_accelerometer_jerk_meanfrequency_Y
  * frequency_body_accelerometer_jerk_meanfrequency_Z
  * frequency_body_gyrometer_mean_X
  * frequency_body_gyrometer_mean_Y
  * frequency_body_gyrometer_mean_Z
  * frequency_body_gyrometer_meanfrequency_X
  * frequency_body_gyrometer_meanfrequency_Y
  * frequency_body_gyrometer_meanfrequency_Z
  * frequency_body_accelerometer_magnitude_mean
  * frequency_body_accelerometer_magnitude_meanfrequency
  * frequency_body_accelerometer_jerkmagnitide_mean
  * frequency_body_accelerometer_jerkmagnitide_meanfrequency
  * frequency_body_gyrometer_magnitude_mean
  * frequency_body_gyrometer_magnitude_meanfrequency
  * frequency_body_gyrometer_jerkmagnitide_mean
  * frequency_body_gyrometer_jerkmagnitide_meanfrequency
  * angle_time_body_accelerometer_mean_gravity
  * angle_time_body_accelerometer_jerk_mean_gravity_mean
  * angle_time_body_gyrometer_mean_gravity_mean
  * angle_time_body_gyrometer_jerk_mean_gravity_mean
  * angle_X_gravity_mean
  * angle_Y_gravity_mean
  * angle_Z_gravity_mean
  * time_body_accelerometer_std_X
  * time_body_accelerometer_std_Y
  * time_body_accelerometer_std_Z
  * time_gravity_accelerometer_std_X
  * time_gravity_accelerometer_std_Y
  * time_gravity_accelerometer_std_Z
  * time_body_accelerometer_jerk_std_X
  * time_body_accelerometer_jerk_std_Y
  * time_body_accelerometer_jerk_std_Z
  * time_body_gyrometer_std_X
  * time_body_gyrometer_std_Y
  * time_body_gyrometer_std_Z
  * time_body_gyrometer_jerk_std_X
  * time_body_gyrometer_jerk_std_Y
  * time_body_gyrometer_jerk_std_Z
  * time_body_accelerometer_magnitude_std
  * time_gravity_accelerometer_magnitude_std
  * time_body_accelerometer_jerkmagnitide_std
  * time_body_gyrometer_magnitude_std
  * time_body_gyrometer_jerkmagnitide_std
  * frequency_body_accelerometer_std_X
  * frequency_body_accelerometer_std_Y
  * frequency_body_accelerometer_std_Z
  * frequency_body_accelerometer_jerk_std_X
  * frequency_body_accelerometer_jerk_std_Y
  * frequency_body_accelerometer_jerk_std_Z
  * frequency_body_gyrometer_std_X
  * frequency_body_gyrometer_std_Y
  * frequency_body_gyrometer_std_Z
  * frequency_body_accelerometer_magnitude_std
  * frequency_body_accelerometer_jerkmagnitide_std
  * frequency_body_gyrometer_magnitude_std
  * frequency_body_gyrometer_jerkmagnitide_std
* *mean* the numeric value here is the mean of the measure by subject by activity
  
## Mapping vs. Source Data

Since the structure of the "test" and "train" datasets are the same, we use <dataset> in the table below to denote replacement values.

| Output Variable  | Output Factor | Source File             | Source Variable |
| ---------------- | ------------- | ----------------------- | --------------- |
| subject | N/A | subject_\<dataset>\.txt | N/A |
| activity | walking | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A |  
| activity | walking_upstairs | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A |  
| activity | walking_downstairs | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A  |
| activity | sitting | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A |  
| activity | standing | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A |  
| activity | laying | y_\<dataset>\.txt (factors from activity_labels.txt) | N/A |  
| measure | time_body_accelerometer_mean_X | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-mean()-X |
| measure | time_body_accelerometer_mean_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-mean()-Y |
| measure | time_body_accelerometer_mean_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-mean()-Z |
| measure | time_gravity_accelerometer_mean_X | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-mean()-X |
| measure | time_gravity_accelerometer_mean_Y | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-mean()-Y |
| measure | time_gravity_accelerometer_mean_Z | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-mean()-Z |
| measure | time_body_accelerometer_jerk_mean_X | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-mean()-X |
| measure | time_body_accelerometer_jerk_mean_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-mean()-Y |
| measure | time_body_accelerometer_jerk_mean_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-mean()-Z |
| measure | time_body_gyrometer_mean_X | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-mean()-X |
| measure | time_body_gyrometer_mean_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-mean()-Y |
| measure | time_body_gyrometer_mean_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-mean()-Z |
| measure | time_body_gyrometer_jerk_mean_X | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-mean()-X |
| measure | time_body_gyrometer_jerk_mean_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-mean()-Y |
| measure | time_body_gyrometer_jerk_mean_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-mean()-Z |
| measure | time_body_accelerometer_magnitude_mean | X_\<dataset>\.txt (factors from features.txt) | tBodyAccMag-mean() |
| measure | time_gravity_accelerometer_magnitude_mean | X_\<dataset>\.txt (factors from features.txt) | tGravityAccMag-mean() |
| measure | time_body_accelerometer_jerkmagnitide_mean | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerkMag-mean() |
| measure | time_body_gyrometer_magnitude_mean | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroMag-mean() |
| measure | time_body_gyrometer_jerkmagnitide_mean | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerkMag-mean() |
| measure | frequency_body_accelerometer_mean_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-mean()-X |
| measure | frequency_body_accelerometer_mean_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-mean()-Y |
| measure | frequency_body_accelerometer_mean_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-mean()-Z |
| measure | frequency_body_accelerometer_meanfrequency_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-meanFreq()-X |
| measure | frequency_body_accelerometer_meanfrequency_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-meanFreq()-Y |
| measure | frequency_body_accelerometer_meanfrequency_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-meanFreq()-Z |
| measure | frequency_body_accelerometer_jerk_mean_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-mean()-X |
| measure | frequency_body_accelerometer_jerk_mean_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-mean()-Y |
| measure | frequency_body_accelerometer_jerk_mean_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-mean()-Z |
| measure | frequency_body_accelerometer_jerk_meanfrequency_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-meanFreq()-X |
| measure | frequency_body_accelerometer_jerk_meanfrequency_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-meanFreq()-Y |
| measure | frequency_body_accelerometer_jerk_meanfrequency_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-meanFreq()-Z |
| measure | frequency_body_gyrometer_mean_X | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-mean()-X |
| measure | frequency_body_gyrometer_mean_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-mean()-Y |
| measure | frequency_body_gyrometer_mean_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-mean()-Z |
| measure | frequency_body_gyrometer_meanfrequency_X | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-meanFreq()-X |
| measure | frequency_body_gyrometer_meanfrequency_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-meanFreq()-Y |
| measure | frequency_body_gyrometer_meanfrequency_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-meanFreq()-Z |
| measure | frequency_body_accelerometer_magnitude_mean | X_\<dataset>\.txt (factors from features.txt) | fBodyAccMag-mean() |
| measure | frequency_body_accelerometer_magnitude_meanfrequency | X_\<dataset>\.txt (factors from features.txt) | fBodyAccMag-meanFreq() |
| measure | frequency_body_accelerometer_jerkmagnitide_mean | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyAccJerkMag-mean() |
| measure | frequency_body_accelerometer_jerkmagnitide_meanfrequency | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyAccJerkMag-meanFreq() |
| measure | frequency_body_gyrometer_magnitude_mean | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroMag-mean() |
| measure | frequency_body_gyrometer_magnitude_meanfrequency | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroMag-meanFreq() |
| measure | frequency_body_gyrometer_jerkmagnitide_mean | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroJerkMag-mean() |
| measure | frequency_body_gyrometer_jerkmagnitide_meanfrequency | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroJerkMag-meanFreq() |
| measure | angle_time_body_accelerometer_mean_gravity | X_\<dataset>\.txt (factors from features.txt) | angle(tBodyAccMean,gravity) |
| measure | angle_time_body_accelerometer_jerk_mean_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(tBodyAccJerkMean),gravityMean) |
| measure | angle_time_body_gyrometer_mean_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(tBodyGyroMean,gravityMean) |
| measure | angle_time_body_gyrometer_jerk_mean_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(tBodyGyroJerkMean,gravityMean) |
| measure | angle_X_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(X,gravityMean) |
| measure | angle_Y_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(Y,gravityMean) |
| measure | angle_Z_gravity_mean | X_\<dataset>\.txt (factors from features.txt) | angle(Z,gravityMean) |
| measure | time_body_accelerometer_std_X | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-std()-X |
| measure | time_body_accelerometer_std_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-std()-Y |
| measure | time_body_accelerometer_std_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyAcc-std()-Z |
| measure | time_gravity_accelerometer_std_X | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-std()-X |
| measure | time_gravity_accelerometer_std_Y | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-std()-Y |
| measure | time_gravity_accelerometer_std_Z | X_\<dataset>\.txt (factors from features.txt) | tGravityAcc-std()-Z |
| measure | time_body_accelerometer_jerk_std_X | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-std()-X |
| measure | time_body_accelerometer_jerk_std_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-std()-Y |
| measure | time_body_accelerometer_jerk_std_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerk-std()-Z |
| measure | time_body_gyrometer_std_X | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-std()-X |
| measure | time_body_gyrometer_std_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-std()-Y |
| measure | time_body_gyrometer_std_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyGyro-std()-Z |
| measure | time_body_gyrometer_jerk_std_X | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-std()-X |
| measure | time_body_gyrometer_jerk_std_Y | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-std()-Y |
| measure | time_body_gyrometer_jerk_std_Z | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerk-std()-Z |
| measure | time_body_accelerometer_magnitude_std | X_\<dataset>\.txt (factors from features.txt) | tBodyAccMag-std() |
| measure | time_gravity_accelerometer_magnitude_std | X_\<dataset>\.txt (factors from features.txt) | tGravityAccMag-std() |
| measure | time_body_accelerometer_jerkmagnitide_std | X_\<dataset>\.txt (factors from features.txt) | tBodyAccJerkMag-std() |
| measure | time_body_gyrometer_magnitude_std | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroMag-std() |
| measure | time_body_gyrometer_jerkmagnitide_std | X_\<dataset>\.txt (factors from features.txt) | tBodyGyroJerkMag-std() |
| measure | frequency_body_accelerometer_std_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-std()-X |
| measure | frequency_body_accelerometer_std_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-std()-Y |
| measure | frequency_body_accelerometer_std_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAcc-std()-Z |
| measure | frequency_body_accelerometer_jerk_std_X | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-std()-X |
| measure | frequency_body_accelerometer_jerk_std_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-std()-Y |
| measure | frequency_body_accelerometer_jerk_std_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyAccJerk-std()-Z |
| measure | frequency_body_gyrometer_std_X | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-std()-X |
| measure | frequency_body_gyrometer_std_Y | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-std()-Y |
| measure | frequency_body_gyrometer_std_Z | X_\<dataset>\.txt (factors from features.txt) | fBodyGyro-std()-Z |
| measure | frequency_body_accelerometer_magnitude_std | X_\<dataset>\.txt (factors from features.txt) | fBodyAccMag-std() |
| measure | frequency_body_accelerometer_jerkmagnitide_std | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyAccJerkMag-std() |
| measure | frequency_body_gyrometer_magnitude_std | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroMag-std() |
| measure | frequency_body_gyrometer_jerkmagnitide_std | X_\<dataset>\.txt (factors from features.txt) | fBodyBodyGyroJerkMag-std() |
| mean | N/A | X_\<dataset\>.txt | vector row in source datafile |
