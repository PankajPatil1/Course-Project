Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the final step is called `tidy_data.txt`, and uploaded in the course project's form.
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

