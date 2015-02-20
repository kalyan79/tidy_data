Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets,
 where 70% of the volunteers was selected for generating the training data and 30% the test data.
 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components,
 was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low
 frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
 From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
Tidy data analysis
The purpose of this activity to collect raw data, apply transformation and create a tidy data required for further analysis
Final tidy data should contain Mean and standard deviation values from acclerometer and Gyroscope
 
 
Raw data
 
Raw data are obtained from UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
 
 
Data information
 
For each record in the dataset it is provided:
•Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
•Triaxial Angular velocity from the gyroscope.
•A 561-feature vector with time and frequency domain variables.
•Its activity label.
•An identifier of the subject who carried out the experiment.
 
 
Created run_analysis.R functions reads raw input file and creates tidy data
               
Step 1:
Read input files
	features.txt - List of all features.
	activity_labels.txt -  Links the class labels with their activity name.
	X_train.txt - Training set.
	y_train.txt - Training labels.
	X_test.txt - Test set.
	y_test.txt - Test labels.
	subject_train.txt - Training subject details
	subject_test.txt - Text subject details

Step 2:
Read and combine training  and test data set
Combine subject information and training labels
 
Step 3:
All training activity numbers translated as follows
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING
 
Step 4:
Derive the below Complete of data variable  ( XYZ denotes 3 measurements for 3 axis)
 
	TimeBodyAcc-XYZ
	TimeGravityAcc-XYZ
	TimeBodyAccJerk-XYZ
	TimeBodyGyro-XYZ
	TimeBodyGyroJerk-XYZ
	TimeBodyAccMag
	TimeGravityAccMag
	TimeBodyAccJerkMag
	TimeBodyGyroMag
	TimeBodyGyroJerkMag
	FrequencyBodyAcc-XYZ
	FrequencyBodyAccJerk-XYZ
	FrequencyBodyGyro-XYZ
	FrequencyBodyAccMag
	FrequencyBodyAccJerkMag
	FrequencyBodyGyroMag
	FrequencyBodyGyroJerkMag

Step 5:
Calculate average for each variable for each activity and each subject.
 
Step 6:
Final data set contain measurement for each subject's individual activity  in one records
Accelerometer measurements are standard gravity units 'g'.
Gyroscope measurements are radians/second.

