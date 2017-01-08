# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* Reads an untidy data set as provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The script reads all the important files like activity_labels.txt,training.txt,test.txt etc
* This step merges the data collected in step 1 
* The test and training data sets are merged. Also this step merges and creates a single dataframe for labels and subjects
* Since "merge" function reorders the data table while merging, an ID column is introduced which tracks the row numbers
* This step reads and processes the activity labels
* First, the activity_labels.txt is read
* The all_labels track the activity a specific person is doing in numerical form
* The activity_labels and all_labels data tables are coerced to make single data table 
* This step creates the final dataset
* Redundant columns are set as NULL
* The unnecessary "()" are removed from the features data table entries
* The column names are set according to their name in features 
* The mean is calculated for entries of same person and same activity
* The data is written into a text file after removing quotes and rownames

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `all_data`, `all_labels` and `all_subjects` merge the previous datasets to further analysis.
* `features` contains the correct names for the `all_data` dataset, which are applied to the column names stored in `features_colno`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activity_labels` variable.
* `all_data` is added with column names
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
