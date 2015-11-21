* * *
# **Getting and Cleaning Data Project**
* * *

This repository contains my project work for the Coursera Course **Getting and Cleaning Data**.

<br><br>

##### **Raw Data**

* The raw data required for this project is not stored in this repository. It can be obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* A full description of the raw data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

* Extract the folder `UCI HAR Dataset` from the zip file and move the folder to the working directory.

<br><br>

##### **tidy_data.txt**

* Contain the tidy data set derived from the above raw data.
* Use `read.table("tidy_data.txt", header = TRUE)` command to retrieve the tidy data set from the text file.

<br><br>

##### **CodeBook.md**

* Describe each variable and its values found in the tidy data set stored in tidy_data.txt.

<br><br>

##### **run_analysis.R**

* Read the activity labels and the feature names from:
    * UCI HAR Dataset/activity_labels.txt
    * UCI HAR Dataset/features.txt
* Read and merge the following data files to form the training data.
    * UCI HAR Dataset/train/subject_train.txt
    * UCI HAR Dataset/train/y_train.txt
    * UCI HAR Dataset/train/X_train.txt
* Read and merge the following data files to form the test data.
    * UCI HAR Dataset/test/subject_test.txt
    * UCI HAR Dataset/test/y_test.txt
    * UCI HAR Dataset/test/X_test.txt
* Merge the training and test data.
* Extract the subject, activity, mean and standard deviation for each measurement from the merged data.
* Label the data set with descriptive variable names. Refer to CodeBook.md for the naming convention used in naming the variables.
* Create a tidy data set with the average of each variable for each activity and each subject and write it to tidy_data.txt in the working directory.

