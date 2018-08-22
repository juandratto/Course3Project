## Code Book

This code book describes the variables, the data and the transformations performed to clean up the data and create a tidy data set.

### Variables description

* df_featLabel: Dataframe from "/features.txt" file.
* df_actiLabel: Dataframe from "/activity_labels.txt" file.
* df_tst_subjData: Dataframe from "/test/subject_test.txt" file.
* df_tst_featData: Dataframe from "/test/X_test.txt" file.
* df_tst_actiData: Dataframe from "/test/y_test.txt" file.
* df_tra_subjData: Dataframe from "/train/subject_train.txt" file.
* df_tra_featData: Dataframe from "/train/X_train.txt" file.
* df_tra_actiData: Dataframe from "/train/y_train.txt" file.
* meanStdColumns: Vector with column names that contain "mean" and "std".
* df_train: Merged training dataframe.
* df_test: Merged test dataframe.
* df_complete: Merged "df_train" and "df_test" dataframe.
* df_tidyData: Final result dataframe.

### Data description

Data collected from the experiments realized with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

### Files procesed

* `features.txt`: List of all features (561).
* `activity_labels.txt`: Links the class labels with their activity name.

* `train/X_train.txt`: 7352 observations with all the features (561) for 21 volunteers.
* `train/subject_train.txt`: Integer vector with the volunteer ID linked to the observations in `X_train.txt`.
* `train/y_train.txt`: Integer vector with the activity ID the observations in `X_train.txt`.

* `test/X_test.txt`: 2947 observations with all the features (561) for 9 volunteers.
* `test/subject_test.txt`: Integer vector with the volunteer ID linked to the observations in `X_test.txt`.
* `test/y_test.txt`: Integer vector with the activity ID the observations in `X_test.txt`.

More information about the files is available in `README.txt`. 
More information about the features is available in `features_info.txt`.

### Transformations performed

1) Load all files to process into dataframes  
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) merge dataframes.
4) Uses descriptive activity names to name the activities.
5) Appropriately labels the data set with descriptive variable names and convert the activity column to factor.
6) Write a tidy dataset into "tidyData.csv" file with the average of each variable for each activity and each subject.