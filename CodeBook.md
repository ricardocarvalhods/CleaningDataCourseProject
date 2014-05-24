CodeBook
============================

Describes the variables, data and transformations performed to clean up the data and create a tidy dataset from the file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Assumes that:
- Data.table library is installed
- The zip file mentioned above is extracted and creates a folder on the same path containing the script
The script runs in eight different parts, as depicted below. It creates different variables in each of the steps, for traceability purposes, and returns the final tidy dataset in the end.

### PART One - Loading labels

Steps:
1. Loads activities labels
2. Loads features labels

Variables created:
- activities_labels:
- features_labels:

### PART Two - Loading all test datasets (measurements, subjects, activities)

Steps:
1. Loads test data measurements
2. Loads test data subjects
3. Loading test data activities

Variables created:
- test:
- test_subjects:
- test_activities:

### PART Three - Loading all train datasets (measurements, subjects, activities)

Steps:
1. Loads train data measurements
2. Loads test data subjects
3. Loads test data activities

Variables created:
- train:
- train_subjects:
- train_activities:

### PART Four - Preparing to extract only the measurements on the mean and standard deviation

Steps:
1. Creates vector of selected features (mean and standard measurements)

Variables created:
- toMatch: Vector containing words to be filtered, that is, "mean" and "std"
- matches: Vector containing the names of the columns having "mean" and "std" on their names
- selected_features: Dataframe with the number of the column filtered and its name
- selected_features_v: Vector containing the names of the columns filtered in terms of Vn, that is, V1, V2, ...

### PART Five - Extracting of test data only the measurements on the mean and standard deviation, merging all test datasets (measurements, subjects, activities) and changing column activities ID to its Description in selected test data

Steps:
1. Filters test data by selected features 
2. Renames selected test data
3. Merges selected test data with subjects and activities
4. Merges activities data to change column activities ID to its Description in selected test data

Variables created:
- test_selected:
- complete_test:
- complete_test_desc:

### PART Six - Extracting of train data only the measurements on the mean and standard deviation, merging all train datasets (measurements, subjects, activities) and changing column activities ID to its Description in selected train data

Steps:
1. Filters train data by selected features 
2. Renames selected train data
3. Merges selected train data with subjects and activities
4. Merges activities data to change column activities ID to its Description in selected train data

Variables created:
- train_selected:
- complete_train:
- complete_train_desc:

### PART Seven - Merging the two complete datasets (train and test)

Steps:
1. Merges test and train datasets

Variables created:
- complete_data:

### PART Eight - Creating independent tidy dataset with the average of each variable for each activity and subject

Steps:
1. Loads data.table library
2. Transforms complete data into data.table format
3. Applies mean to rows grouped by SubjectID and Activity
4. Returns final tidy dataset

Variables created:
- DT:
- Final_DT:
