'Getting and Cleaning Data' Course Project
=========================

Contains script and its code book for getting and cleaning data course project on coursera.

Contains two files:
- run_analysis.R
- CodeBook.md

The script run_analysis.R is used to accomplish the course project. Which is obtain data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and create a tidy data set with the following main instructions:
- Merges the training and the test sets to create one data set
- Extracts only the measurements on the mean and standard deviation for each measurement
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names
- Creates a independent tidy data set with the average of each variable for each activity and each subject

For that run_analysis.R considers that the zip file mentioned above is extracted and creates a folder on the same path containing the script. It also considers the data.table library installed.

The file CodeBook.md contains information about the variables, the data and the transformations performed to clean up the data and create the tidy dataset.
