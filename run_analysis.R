library(dplyr)

# Read labels and names
activity.labels = read.table("UCI HAR Dataset/activity_labels.txt", sep = "")
activity.labels = as.character(activity.labels$V2)
feature.names = read.table("UCI HAR Dataset/features.txt", sep = "")
feature.names = feature.names$V2

# Read training data
subject = read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")
subject = as.factor(subject$V1)
activity = read.table("UCI HAR Dataset/train/y_train.txt", sep = "")
activity = as.factor(activity$V1)
levels(activity) = activity.labels
features = read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
names(features) = feature.names
train.data = cbind(subject, activity, features)

# Read test data
subject = read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")
subject = as.factor(subject$V1)
activity = read.table("UCI HAR Dataset/test/y_test.txt", sep = "")
activity = as.factor(activity$V1)
levels(activity) = activity.labels
features = read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
names(features) = feature.names
test.data = cbind(subject, activity, features)

# Merge the training and test data
data = rbind(train.data, test.data)

# Extract the subject, activity, mean and standard deviation for each measurement
ids = grep("subject|activity|mean|std", names(data))
data = data[,ids]

# Label the data set with descriptive variable names
var.names = names(data)
var.names[1] = "Subject"
var.names[2] = "Activity"
var.names = gsub("\\(\\)", "", var.names)
var.names = gsub("^t", "TD\\.", var.names)
var.names = gsub("^f", "FD\\.", var.names)
var.names = gsub("-mean-X$", "\\.X\\.Mean", var.names)
var.names = gsub("-mean-Y$", "\\.Y\\.Mean", var.names)
var.names = gsub("-mean-Z$", "\\.Z\\.Mean", var.names)
var.names = gsub("-mean$", "\\.Mean", var.names)
var.names = gsub("-std-X$", "\\.X\\.Std", var.names)
var.names = gsub("-std-Y$", "\\.Y\\.Std", var.names)
var.names = gsub("-std-Z$", "\\.Z\\.Std", var.names)
var.names = gsub("-std$", "\\.Std", var.names)
var.names = gsub("-meanFreq-X$", "\\.X\\.MeanFreq", var.names)
var.names = gsub("-meanFreq-Y$", "\\.Y\\.MeanFreq", var.names)
var.names = gsub("-meanFreq-Z$", "\\.Z\\.MeanFreq", var.names)
var.names = gsub("-meanFreq$", "\\.MeanFreq", var.names)
var.names = gsub("Mag", "\\.Mag", var.names)
var.names = gsub("BodyBody", "Body", var.names)
names(data) = var.names

# Create a tidy data set with the average of each variable for each activity
# and each subject and write it to tidy_data.txt.
tidy.data = data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(tidy.data, file = "tidy_data.txt", row.name = FALSE)