# Course-Project
Final Project of the course "Getting and Cleaning Data" 
The script run_analysis.R does the following tasks:
*Reads an untidy data set as provided at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  1.The script reads all the important files like activity_labels.txt,training.txt,test.txt etc
*This step merges the data collected in step 1 
  1.The test and training data sets are merged. Also this step merges and creates a single dataframe for labels and subjects
  2.Since "merge" function reorders the data table while merging, an ID column is introduced which tracks the row numbers
*This step reads and processes the activity labels
  1.First, the activity_labels.txt is read
  2.The all_labels track the activity a specific person is doing in numerical form
  3.The activity_labels and all_labels data tables are coerced to make single data table 
*This step creates the final dataset
  1.Redundant columns are set as NULL
  2.The unnecessary "()" are removed from the features data table entries
  3.The column names are set according to their name in features 
  4.The mean is calculated for entries of same person and same activity
  5.The data is written into a text file after removing quotes and rownames
