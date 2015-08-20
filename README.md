# GettingCleaningDataProject
Project for Getting and Cleaning Data Course
#
# File:  run_analysis.R
#
# This script:
# - reads in the specified training and testing data,
# - merges the data, 
# - adds appropriate subjects and activities,
# - creates meaningful names for the activities,
# - calculates the averages of each column by subject and activity, and
# - writes the results to the file run_analysis.txt
#
# Assumptions:
#
# - The "dplyr" package is already installed and loaded:
#
#   install.packages("dplyr")
#   library(dplyr)
#
# - The following Samsung data is in the working (current) directory:
#
#   features.txt
#   X_train.txt
#   subject_train.txt
#   y_train.txt
#   X_test.txt
#   subject_test.txt
#   y_test.txt
#
