# Getting and Cleaning Data

For this assignment the script run_analysis.R was developed with the following requirements:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data

The script expects the data from the below link to be extracted in the containing folder:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files must be present:

* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt

## What the script does:

* Read all required data files
* Merge the data as required
    + Merge test subject, activity and measurements
    + Merge training subject, activity and measurements
    + Union both merged data sets in one data.table
* Clean up the column headers
* Replace activity IDs with labels
* Select only measurements with mean or standard deviation
* Create a summary with means for all columns
* Save the summary as "tidy_summary.txt"