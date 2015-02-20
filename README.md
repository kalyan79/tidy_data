run_analysis.R functions reads input file and creates tidy data as follows

#Input files:
	
	features.txt - List of all features.
	activity_labels.txt -  Links the class labels with their activity name.
	X_train.txt - Training set.
	y_train.txt - Training labels.
	X_test.txt - Test set.
	y_test.txt - Test labels.
	subject_train.txt - Training subject details
	subject_test.txt - Text subject details
 
#Read activity and features details
1. Reads features.txt to get the column description and its corresponding column position into features_df dataframe.
2. Extracts only mean and standarad deviation columns (by grep 'mean' and 'std') and assign required columns into. features_df dataframe
3. Assign the required column no from features_df in mycols variable.
4. Reads activity_labels.txt into activity_label dataframe to get the activity names(lables) to be assigned  in the tidy data set.
 
#Reading training data set
5. Reads only the required columns from X_train ( training data set) by mycols variable and assign it to x_train_data dataframe. This will help to use less memory space and efficient processing time.
6. Reads subject_train.txt  and  y_train.txt to get subject information and subject's activity information respectively.
7. Column bind (cbind)  subject information, training activity  and  mean and std values from x_train_data dataframe. ( since the no.of rows are same in all the files)
     Captures  mean and std values from accelerometer and gyroscope for subject's involved in training into x_train_data dataframe.
 
#Reading test data set
8. Repeats 5-7  for test data to get mean and std values for test data from accelerometer and gyroscope to capture in x_test_data.
 
#Combining training and test data
9. Combines test and training data with rbind to get a single data frame as x_tidy_data.
 
#Descriptive name to activity  and create initial data set
10. Merges activity_label and x_tidy_data to get the descriptive activity name for the activity name in x_tidy_data
    x_tidy_data now formatted with mean,standard deviation values and activity label for each subject.
 
#Final data set(average) and output
11. Using summarise_each function, it creates  a second independent tidy data set in x_tidy_data with the average of each variable for each activity and each subject.
12. Formats x_tidy_data  and writes it to output file subject_activity.txt.
