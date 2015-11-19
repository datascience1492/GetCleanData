# Getting and Cleaning Data: Course Project Code Book

This code book describes the data used in my [Course Project](https://github.com/datascience1492/GetCleanData) and the transformations performed on it to clean it up and produce my results.

## Data source

The original data set is available on the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The script does not download the data from there, but from this [copy](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) created for the course.

As of November 2015, the data available at both URLs is identical.

## Original description of the data set

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.*

## Files in the original data set

The original data set contains two subdirectories: `test` and `train`. They have the exact same structure and just correspond to data obtained with different individuals, as explained in the original description. We will therefore describe the `test` subdirectory only.

Files used :

* `./activity_labels.txt` contains the correspondences between activity codes (an integer from 1 to 6) and activity names (see previous section).
* `./features.txt` contains the names of the 561 features contained in the vector described in the above.
* `./test/X_test.txt` contains 2947 feature vectors derived from the raw data as explained in the original description.
* `./test/y_test.txt` contains 2947 integers from 1 to 6, indicating the activity which generated the data from which the corresponding feature vector was derived.
* `./test/subjects_test.txt` contains 2947 integers from 1 to 6, indicating the activity which generated the data from which the corresponding feature vector was derived.

The directory `Inertial Signals` contains the raw data from which `./test/X_test.txt` was derived, but I did not use it in my analysis.

## Data transformations performed

The following transformations where applied to the original data:

1. The feature vectors in `/test/X_test.txt` and `/train/X_train.txt` were merged into the variable `allData`
2. A subset of `allData` containing only the features corresponging to the mean and standard deviation for each measurement was stored in `selectedData`.
3. Two columns were added at the beginning of `selectedData`: one containing the activitiy (from `/test/y_test.txt`) and another containing the subject (from `./test/subjects_test.txt`). The activitiy codes were replaced with the names contained in `./activity_labels.txt`.
4. The columns of `selectedData` were given descriptive names (*Activity*, *Subject* and those from `./features.txt`).
5. The average of each variable for each activity and each subject was stored in a new data set called `tidyData`.

## Results

The tidy data set `tidyData` is saved in the file `./tidyData.txt`.