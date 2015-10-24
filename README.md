# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The project includes the following files:
* **run\_analysis.R**.  This is a script in R language that reads data from the *Human Activity Recognition Using Smartphones Data Set* project and process them to do the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set
     with the average of each variable for each activity and each subject.
  6. Saves a txt file with the tidy data set created in step 5 of the instructions.

* **CodeBook.md**.  A code book describing each variable in the tidy data set and its values.

* **README.md**.  This file, it contains a description of the raw data used as inputs for this project, the transformations applied to convert it to a tidy data set, and the output files generated.

## The raw data inputs

The raw data used in this project, *Human Activity Recognition Using Smartphones Dataset Version 1.0*, can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, or in this publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The files included in the data set are described in full detail in accompanying documentation text files in the zip, but for the purpose of this project it is important to highlight the following points, extracted from those documents, about the nature of the information included and the files where it is located:

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

Given the requirements of this project our script will use only a few of the files included in the dataset and are following:

* **features.txt**: List of all features.
* **activity\_labels.txt**: Links the activity identifiers with their activity name.
* **train/X\_train.txt**: Training set measurements.
* **train/y\_train.txt**: Training activity identifiers.
* **train/subject\_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* **test/X\_test.txt**: Test set measurements.
* **test/y\_test.txt**: Test activity identifiers.
* **test/subject\_test.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The following files are not needed by the script, but include invaluable documentation of the contents of the previous files and thus they were essential to complete this assignment:

* **README.txt**:  Description of the experiment executed.
* **features\_info.txt**: Shows information about the variables used on the feature vector.

The files that were *not* used are those in the *Inertial Signals* folders of the train and test sets since only the variables related to the mean and standard deviation calculations were required, lacking detailed information on the columns of the inertial signals files, no such variables can be inferred from these files.


## Transformations

All the transformation are done within a single script file named **run\_analysis.R**, and are executed immediately after sourcing it without requiring an additional invocation of a function, just execute the next command in the R console:
```
soruce("run_analysis.R")
```

### Process detail

The script reads data from the Human Activity Recognition Using Smartphones Data Set project and process them to do the following:

1. Merges the training and the test sets to create one data set.
  * For a given set folder, test or train, it reads the text files **subject\_?**, **y\_?** and **X\_?**, in that order.
  * Since all the files in the same set contain information about the same observations they are merged as columns (variables) of the same table.  According to tidy data principle #1: Each variable should be in one column.
  * Both sets have the same variables but for different observations on different subjects, the data generated in the previous step for test and train sets is then merged as rows of the same table.  According to tidy data principle #2: Each different observation should be in a different row.
  * At this point we have all data in a single tidy data table.  Congruent with tidy data principle #3: Each type of observational unit forms a table.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  * Reads the feature names from the file **feactures.txt**.
  * In order to identify the required columns it assigns temporary columns names: **Subject** to the column read from the files *subject\_?*, **Activity** to the column read from the files *y\_?*, and the feature descriptions to the corresponding columns from the files *x\_?*.
  * Finally, it selects only the columns that are required by this project, which are: **Subject**, **Activity**, and all the features containing the text **-mean()** or **-std()** in its name.
  * Notice that all the columns that may contain the word *mean* as part of a longer word but doesn't contain it in the form *-mean()* were *not* included, only the variables direclt associated to the mean() and std() calculations.

3. Uses descriptive activity names to name the activities in the data set.
  * Reads the activity names from the file **activity\_labels.txt**.
  * Replaces the underscores in the names with a space.
  * Replaces the activity identifiers in the main data set with these names.

4. Appropriately labels the data set with descriptive variable names. 
  * Labels are generated programmatically by replacing the cryptic text patterns in the features' names with a more descriptive label, the rules applied are:
    * Replace a leading **t** with the word **Time**.
    * Replace a leading **f** with the word **Frequency**.
    * Replace **BodyBody** with just **Body**.
    * Replace **Acc** with **Acceleration**.
    * Replace **Mag** with **Magnitude**.
    * Replace **Gyro** with **Gyroscope**.
    * Replace **-mean()** with **Mean**.
    * Replace **-std()** with **Standard Deviation**.
    * Replace **-X**, **-Y**, and **-Z** with **X**, **Y** and **Z** respectively.
    * Add a space between an upper case letter and its presiding character.
  * At this point a feature like "tBodyAcc-mean()-X" is now a descriptive label like "Time Body Acceleration Mean X"
  * Labels are saved in the file *variables.txt* for documenting purposes.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * Data is grouped by **Activity** and **Subject**, in that order.
  * And for each feature in this data set calculates the average.
  * This new data table is saved to a file using the function `write.table()` with the option `row.names = FALSE`.


## Output files

Two output files are generated by the script:

1. **activity\_subject\_means.txt**.  It contains the data in the tidy data set generated in step 5 of the instructions, it is created with the function `write.table()` using the `row.name=FALSE` parameter, this file has also been uploaded to Coursera and was allocated in this link https://s3.amazonaws.com/coursera-uploads/user-d0d9b667ac55438824d8619b/975117/asst-3/fec362207a0911e5b0efb1e0630fcdc3.txt.

  Therefore it can be viewed from the R console executing this command:
  ```
  address <- "http://s3.amazonaws.com/coursera-uploads/user-d0d9b667ac55438824d8619b/975117/asst-3/fec362207a0911e5b0efb1e0630fcdc3.txt"
  data <- read.table(url(address), header = TRUE)
  View(data)
  ```
  (Command from https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment)
  
2. **variables.txt**.  It contains the column names programmatically generated by the script and from the original feature names and used by the data set saved in the previous file, not explicitly required by the project, but created as input to make the code book.


## The code book

Also included in this project is the file **CodeBook.md** with a data dictionary of the variables included in the file *activity_subject_means.txt*, please read it for a detailed description of the variables and values in that file.
