# Getting and Cleaning Data: Course Project

This repository contains my project for the course [Getting and Cleaning Data](https://www.coursera.org/course/getdata) by the Johns Hopkins University on Coursera.

Working on this [data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), the following was to be done:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

All code is contained in the file **run_analysis.R**. There are two documentation files accompanying the code: the one you are reading (**README.md**) and a code book (**CodeBook.md**).

## Instructions

To run the code, just download the file **run_analysis.R** and run the following command in R:

`source("YourDownloadDirectory/run_analysis.R")`

This will create a file called **tidyData.txt** in your current working directory in R containing the data set requested in point number 5 above.

## Dependencies

This script makes use of the `reshape2` package. It checks if it is available and tries to install if it is not.

The data does not need to be in your computer, since the script downloads and uncompresses it. If it is, you should comment or remove the corresponding lines in **run_analysis.R** (lines 8 and 9, under the comment `# Download data`) if you want to avoid downloading it again.



