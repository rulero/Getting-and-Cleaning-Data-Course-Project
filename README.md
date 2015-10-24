# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The project includes the following files:
* **run\_analysis.R**.  This is a script in R language that reads data from the Human Activity Recognition Using Smartphones Data Set project and process them to do the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set
     with the average of each variable for each activity and each subject.
* **CodeBook.md**.  A code book describing each variable and its values in the tidy data set.
* **README.md**.  This file, it contains a description of the raw data used as inputs for this project, the transformations applied to convert it to a tidy data set, and the output files generated.

## The raw data inputs

The raw data used in this project, *Human Activity Recognition Using Smartphones Dataset Version 1.0*, can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  A full description is available at the site where that data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, or in this publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The files included in the data set are described in detail in accompanying documentation text files in the zip, but for the purpose of this project it is important to highlight the following points extracted from those documents, about the nature of the information included and the files where it is located:

> The experiments have been carried out with a group of 30 volunteers.

> Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone.

> Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity.

> The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>
> For each record it is provided:
>
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

Our script will use only a few of the files included in the dataset and are following:

* **features.txt**: List of all features.
* **activity\_labels.txt**: Links the class labels with their activity name.
* **train/X\_train.txt**: Training set.
* **train/y\_train.txt**: Training labels.
* **train/subject\_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* **test/X\_test.txt**: Test set.
* **test/y\_test.txt**: Test labels.
* **test/subject\_test.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Transformations

All the transformation are done within a single file named **run\_analysis.R**, and are executed immediately after sourcing it without requiring an additional invocation of a function, just execute the next command in the R console:
```
soruce("run\_analysis.R")
```

The script reads data from the Human Activity Recognition Using Smartphones Data Set project and process them to do the following:

1. Merges the training and the test sets to create one data set.
  * For each set, test and training, it reads the files **subject\_???.txt**, **y\_???.txt** and **X\_???.txt**, in that order.
  * Since all these files contain information about the same observations they are merged as columns (variables) of the same table.  According to tidy data principle #1 Each variable should be in one column.
  * Each set has the same variables for different observations on different subjects, the data generated in the previous step for test and training is then merged as rows.  According to tidy data principle #2: Each different observation should be in a different row.
  * At this point we have all data in a single tidy data table.  According to tidy data principle #3: Each type of observational unit forms a table

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  * Reads the feature names from the file **feactures.txt**
  * Assigns temporary columns names: **Subject** to the column read from the files *subject\_???.txt*, **Activity** to the column read from the files *y\_???.txt*, and the feature descriptions to the corresponding columns from the files *x\_???.txt*
  * Finally, it selects only the columns that are required by this project, which are: **Subject**, **Activity**, and all the features containing the text **-mean()** or **-std()**
  * Notice that all the columns that may contain the word *mean* as part of a longer word but doesn't contain it in the form *-mean()* were not included.

3. Uses descriptive activity names to name the activities in the data set
  * Reads the activity names from the file **activity\_labels.txt**
  * Replaces the underscores in the names with a space
  * Changes the activity numbers in the data set to these names.

4. Appropriately labels the data set with descriptive variable names. 
  * Labels are generated programmatically replacing the cryptic text patterns in the features names with a more descriptive name, the rules applied are:
    * Replace a leading **t** with **Time**
    * Replace a leading **f** with **Frequency**
    * Replace **BodyBody** with **Body**
    * Replace **Acc** with **Acceleration**
    * Replace **Mag** with **Magnitude**
    * Replace **Gyro** with **Gyroscope**
    * Replace **-mean()** with **Mean**
    * Replace **-std()** with **Standard Deviation**
    * Replace **-X**, **-Y**, and **-Z** with **X**, **Y** and **Z** respectively
    * Add a space between an upper case letter and the previous character
  * At this point a feature like "tBodyAcc-mean()-X" is now a descriptive label like "Time Body Acceleration Mean X"
  * Labels are saved for documenting purposes.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * Data is grouped by **Activity** and **Subject**, in that order
  * And each feature the mean is calculated.
  * This new data table is saved to a file using `write.table()` with the option `row.names = FALSE`


## Output files

Two output files are generated by the script:

1. **activity\_subject\_means.txt**.  It contains the data in the tidy data set generated in step 5 created with `write.table()` using `row.name=FALSE`, this file has also been uploaded to Coursera to this link https://s3.amazonaws.com/coursera-uploads/user-d0d9b667ac55438824d8619b/975117/asst-3/fec362207a0911e5b0efb1e0630fcdc3.txt.
  Therefore it can be viewed from the R console executing this command:
  ```
  address <- "https://s3.amazonaws.com/coursera-uploads/user-d0d9b667ac55438824d8619b/975117/asst-3/fec362207a0911e5b0efb1e0630fcdc3.txt"
  data <- read.table(url(address), header = TRUE)
  View(data)
  ```
  (Command from https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment)
  

2. **variables.txt**.  It contains the column names programmatically generated by the script and used by the data set saved in the previous file, not explicitly required by the project, but created as input to make the code book.


## The code book

Also included in this project is the file **CodeBook.md** with a data dictionary of the variables included in the files *activity_subject_means.txt*, please read it for a description of the variables, including the units, of the data included in the *activity_subject_means.txt* file.
