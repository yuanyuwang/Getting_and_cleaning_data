Getting_and_cleaning_data
=========================

Getting_and_cleaning_data

Save the run_analysis.R into your working directory
Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  and unzip the data to your working directory
In your working directory, you supposed to have a directory called "UCI HAR Dataset" if you do previous steps right

The script will read training set and test sets from files, and merge them into one single dataset
It then filter out columns only related to mean and standard deviation
It names the column of dataset according to activity_label.txt
The result from previous step would stored in "data" variable
It calculated the average of dataset according to subject and activity, and store the result in "tidyData" variable 
It store tidyDate in the file called "Average_by_subject_and_activity.txt"