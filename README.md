# Course-Project
Final Project of the course "Getting and Cleaning Data" 

The script run_analysis.R does the following tasks:
1. Reads an untidy data set as provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * The script reads all the important files like activity_labels.txt,training.txt,test.txt etc
2. This step merges the data collected in step 1 
  *  The test and training data sets are merged. Also this step merges and creates a single dataframe for labels and subjects
  *  Since "merge" function reorders the data table while merging, an ID column is introduced which tracks the row numbers
3. This step reads and processes the activity labels
  *  First, the activity_labels.txt is read
  *  The all_labels track the activity a specific person is doing in numerical form
  *  The activity_labels and all_labels data tables are coerced to make single data table 
4. This step creates the final dataset
  * Redundant columns are set as NULL
  * The unnecessary "()" are removed from the features data table entries
  * The column names are set according to their name in features 
  * The mean is calculated for entries of same person and same activity
  * The data is written into a text file after removing quotes and rownames
