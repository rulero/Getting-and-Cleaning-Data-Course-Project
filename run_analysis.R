# This script reads data from the Human Activity Recognition Using Smartphones
# Data Set project and process them to do the following:
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for
#      each measurement.
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set
#      with the average of each variable for each activity and each subject.
#
#   Creates 2 files:
#      1. activity_subject_means.txt Contains the data in the tidy data set in
#         step 5 created with write.table() using row.name=FALSE.
#      2. variables.txt Contains the column names of the previous file, not
#         explicitly required by the project, but used for documentation.

# The actual data files used come from https://d396qusza40orc.cloudfront.net
# getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Libraries
library(data.table)
library(dplyr)

# data.folder contains the name of the root data folder.
# data.folder <- "UCI HAR Dataset - Debug"
data.folder <- "UCI HAR Dataset"

# Funcitons
# readSet: Read file "name" (with "set" suffix) from "set" folder
readSet <- function(name, set) {
    fread(file.path(data.folder, set, sprintf(name, set)))
}

### 1. Merges the training and the test sets to create one data set.

# List of files in a set (test or training).  "Inertial Signals" files were
# removed from the list since they are NOT actually needed for this project.
set.files <- c("subject_%s.txt", "y_%s.txt", "X_%s.txt")

# Since all set.files contain information about the same observations they are
# merged as columns (variables) of the same table.
# (tidy principle #1 Each variable should be in one column)
test.data <- do.call(cbind, lapply(set.files, readFile, "test"))
train.data <- do.call(cbind, lapply(set.files, readFile, "train"))

# Each set has the same variables for different observations, merge as rows.
# (tidy principle #2: Each different observation should be in a different row)
# (tidy principle #3: Each type of observational unit forms a table)
all.data <- rbind(test.data, train.data)


### 2. Extracts only the measurements on the mean and standard deviation for
#      each measurement.

# Assign variable names using descriptions from features.txt
features <- fread(file.path(data.folder, "features.txt"))
colnames(all.data) <- c("Subject", "Activity", features$V2)

# Keep only the columns we want: subject, activity, *-mean()s and *-std()s
# Notice the pattern will leave out partial matches, such as meanFreq!
all.data <- select(all.data, matches("Subject|Activity|-mean\\(|-std\\("))


### 3. Uses descriptive activity names to name the activities in the data set

# Read activities from activity_labels.txt, but replace underscore with space
activities <- fread(file.path(data.folder, "activity_labels.txt"))
activities$V2 <- gsub("_", " ", activities$V2)

# Change Activity numbers to Activity names in all.data
all.data$Activity <- mapvalues(as.character(all.data$Activity)
                               , from = as.character(activities$V1)
                               , to = activities$V2)


### 4. Appropriately labels the data set with descriptive variable names. 

# Substitute cryptic text patterns in variables with a descriptive name
colnames(all.data) <- colnames(all.data) %>%
    gsub("^t", "Time", .) %>%                       # Leading t means Time
    gsub("^f", "Frequency", .) %>%                  # Leading f means Frequency
    gsub("(Body)+", "Body", .) %>%                  # BodyBody becomes Body
    gsub("Acc", "Acceleration", .) %>%              # Acc is Acceleration
    gsub("Mag", "Magnitude", .) %>%                 # Mag stands for Magnitude
    gsub("Gyro", "Gyroscope", .) %>%                # Gyro stands for Gyroscope
    gsub("-mean\\(\\)", "Mean", .) %>%              # -mean() becomes Mean
    gsub("-std\\(\\)", "StandardDeviation", .) %>%  # -std() Standard Deviation
    gsub("-([XYZ])", "\\1", .) %>%                  # -X, -Y, -Z to X, Y, Z
    gsub("(.)([[:upper:]])", "\\1 \\2", .)          # Add space at upper case
# Names like "tBodyAcc-mean()-X" are now "Time Body Acceleration Mean X"

# Save column names to use them in the cook bock
write.table(colnames(all.data), 'variables.txt', quote = FALSE, col.names = F)


## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

tidy.data <-
    all.data %>%
    group_by(Activity, Subject) %>%
    summarise_each(funs(mean))

# Create output file
write.table(tidy.data, "activity_subject_means.txt", row.names = FALSE)
