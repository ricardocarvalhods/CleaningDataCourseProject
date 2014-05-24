# CodeBook

Describes the variables, data and transformations performed by [run_analysis.R](https://github.com/ricardo-sc/CleaningDataCourseProject/blob/master/run_analysis.R) to clean up the data and create a tidy dataset from the file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

###### Assumes that:
- The **data.table** library is **installed**
- The zip file mentioned above is extracted and creates a **folder** on the **same path** containing the [run_analysis.R](https://github.com/ricardo-sc/CleaningDataCourseProject/blob/master/run_analysis.R) **script**

The script runs in eight different parts, as depicted below. It creates different variables in each of the steps, for traceability purposes, and returns the final tidy dataset in the end in the data.table format. Refer to the comments on the script file [run_analysis.R](https://github.com/ricardo-sc/CleaningDataCourseProject/blob/master/run_analysis.R) to obtain the code for each step mentioned here - their names match.

## PART One

###### Objectives:
1. Loading labels

###### Steps:
1. Loads activities labels
2. Loads features labels

###### Variables created:
- **activities_labels:** Data frame containing activities IDs and their descriptions
- **features_labels:** Data frame containing measurements numbers and their descriptions

## PART Two

###### Objectives: 
1. Loading all test datasets (measurements, subjects, activities)

###### Steps:
1. Loads test data measurements
2. Loads test data subjects
3. Loading test data activities

###### Variables created:
- **test:** Data frame containing all measurement test data
- **test_subjects:** Data frame containing subject IDs for each test data
- **test_activities:** Data frame containing activities IDs for each test data

## PART Three

###### Objectives: 
1. Loading all train datasets (measurements, subjects, activities)

###### Steps:
1. Loads train data measurements
2. Loads test data subjects
3. Loads test data activities

###### Variables created:
- **train:** Data frame containing all measurement train data
- **train_subjects:** Data frame containing subject IDs for each train data
- **train_activities:** Data frame containing activities IDs for each train data

## PART Four

###### Objectives:
1. Preparing to extract only the measurements on the mean and standard deviation

###### Steps:
1. Creates vector of selected features (mean and standard measurements)

###### Variables created:
- **toMatch:** Vector containing words to be filtered, that is, "mean" and "std"
- **matches:** Vector containing the names of the columns having "mean" and "std" on their names
- **selected_features:** Data frame with the number of the column filtered and its name
- **selected_features_v:** Vector containing the names of the columns filtered in terms of "Vn", that is, V1, V2, ...

## PART Five

###### Objectives:
1. Extracting of test data only the measurements on the mean and standard deviation
2. Merging all test datasets (measurements, subjects, activities)
3. Changing column activities ID to its Description in selected test data

###### Steps:
1. Filters test data by selected features 
2. Renames selected test data
3. Merges selected test data with subjects and activities
4. Merges activities data to change column activities ID to its Description in selected test data

###### Variables created:
- **test_selected:** Data frame containing test data only with the selected features
- **complete_test:** Data frame containing merged test data only with the selected features, subjects and activities data
- **complete_test_desc:** Data frame containing merged test data only with the selected features, subjects and activities data (with activities descriptions instead of IDs)

## PART Six

###### Objectives:
1. Extracting of train data only the measurements on the mean and standard deviation
2. Merging all train datasets (measurements, subjects, activities)
3. Changing column activities ID to its Description in selected train data

###### Steps:
1. Filters train data by selected features 
2. Renames selected train data
3. Merges selected train data with subjects and activities
4. Merges activities data to change column activities ID to its Description in selected train data

###### Variables created:
- **train_selected:** Data frame containing train data only with the selected features
- **complete_train:** Data frame containing merged train data only with the selected features, subjects and activities data
- **complete_train_desc:** Data frame containing merged train data only with the selected features, subjects and activities data (with activities descriptions instead of IDs)

## PART Seven

###### Objectives:
1. Merging the two complete datasets (train and test)

###### Steps:
1. Merges test and train datasets

###### Variables created:
- **complete_data:** Data frame containing merged test and train data only with the selected features, subjects and activities description data

## PART Eight

###### Objectives:
1. Creating independent tidy dataset with the average of each variable for each activity and subject

###### Steps:
1. Loads data.table library
2. Transforms complete data into data.table format
3. Applies mean to rows grouped by SubjectID and Activity
4. Returns final tidy dataset

###### Variables created:
- **DT:** Data table containing merged test and train data only with the selected features, subjects and activities description data
- **Final_DT:** Data frame obtained from "DT" grouping rows by SubjectID and Activity and applying mean average on each of the measurements
