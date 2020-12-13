## Getting and Cleaning Data Project Cookbook

The original information about the variables could be accessed on the features info and readMe file in the UCI HAR Dataset. While the tidy dataset is saved in the text file tidy_data.txt

From the readMe text file

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six       activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the       waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a       constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly       partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
      
  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding       windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion       components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to       have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was       obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

From the original dataset only the mean and standard deviation values were obtained from the following variables
 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag
 - gravityMean
 - tBodyAccMean
 - tBodyAccJerkMean
 - tBodyGyroMean
 - tBodyGyroJerkMean

The X-Y-Z values in the columns denotes the feature vector for each variable. 

The two factor levels activity and subject defines the type of activity which were used in the analysis as a factor to group the variables and compute for their mean

