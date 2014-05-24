##################################################################################################################
# PART One - Loading labels
##################################################################################################################

# Loading activities labels
activities_labels <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt", col.names=c('ActivityID', 'Activity'))

# Loading features labels
features_labels <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt")

##################################################################################################################
# PART Two - Loading all test datasets (measurements, subjects, activities)
##################################################################################################################

# Loading test data measurements
test <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")

# Loading test data subjects
test_subjects <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", col.names=c('SubjectID'))

# Loading test data activities
test_activities <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\Y_test.txt", col.names=c('ActivityID'))

##################################################################################################################
# PART Three - Loading all train datasets (measurements, subjects, activities)
##################################################################################################################

# Loading train data measurements
train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")

# Loading test data subjects
train_subjects <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", col.names=c('SubjectID'))

# Loading test data activities
train_activities <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Y_train.txt", col.names=c('ActivityID'))

##################################################################################################################
# PART Four - Preparing to extract only the measurements on the mean and standard deviation
##################################################################################################################

# Creates vector of selected features (mean and standard measurements)
#head(features_labels, n=300)
toMatch <- c("mean", "std")
matches <- unique (grep(paste(toMatch,collapse="|"), features_labels$V2, value=TRUE))
selected_features <- features_labels[features_labels$V2 %in% matches, ]
selected_features_v <- paste(rep("V", times=48), selected_features[,1], sep="")

##################################################################################################################
# PART Five - Extracting of test data only the measurements on the mean and standard deviation
#             Merging all test datasets (measurements, subjects, activities)
#             Changing column activities ID to its Description in selected test data
##################################################################################################################

# Filters test data by selected features 
test_selected <- test[, names(test) %in% selected_features_v]

# Renames selected test data
colnames(test_selected) <- selected_features[,2]

# Merges selected test data with subjects and activities
complete_test <- cbind(test_subjects, test_selected, test_activities)

# Merges activities data to change column activities ID to its Description in selected test data
complete_test_desc <- (merge(complete_test, activities_labels, all=TRUE))[,-1]

##################################################################################################################
# PART Six - Extracting of train data only the measurements on the mean and standard deviation
#            Merging all train datasets (measurements, subjects, activities)
#            Changing column activities ID to its Description in selected train data
##################################################################################################################

# Filters train data by selected features 
train_selected <- train[, names(train) %in% selected_features_v]

# Renames selected train data
colnames(train_selected) <- selected_features[,2]

# Merges selected train data with subjects and activities
complete_train <- cbind(train_subjects, train_selected, train_activities)

# Merges activities data to change column activities ID to its Description in selected train data
complete_train_desc <- (merge(complete_train, activities_labels, all=TRUE))[,-1]

##################################################################################################################
# PART Seven - Merging the two complete datasets (train and test)
##################################################################################################################

# Merges test and train datasets
complete_data <- rbind(complete_test_desc, complete_train_desc)

##################################################################################################################
# PART Eight - Creating independent tidy dataset with the average of each variable for each activity and subject
##################################################################################################################

# Loads data.table library
library(data.table)

# Transforms complete data into data.table format
DT <- data.table(complete_data)

# Applies mean to rows grouped by SubjectID and Activity
Final_DT <- DT[, lapply(.SD, mean), by=list(SubjectID,Activity)]

# Returns final tidy dataset
Final_DT
