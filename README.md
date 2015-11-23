run_analysis.R performs the following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. We consider meanFreq variables should be included.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names such as tBodyAcc-std()-Y.
5. Merge "subject" and "activity" as the first and second column of the data set.
6. Dump the final merged data into a file called tidydata1.txt
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Dump this data set to a file called tidydata2.txt.

