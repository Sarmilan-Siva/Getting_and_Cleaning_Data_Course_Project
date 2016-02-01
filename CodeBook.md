# Code Book - Getting and Cleaning Data Course Project 

This Code Book describes the variables, the data, and the transformations that was performed to clean up the data.

## Original Data and the Variables
The Original Dataset, Human Activity Recognition Using Smartphones was downloaded from the UCI Machine Learning Repository. The Datasets and a description of the data used in this project can be found at their webpage.
The link is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset for the project was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers. Using embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity when each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time and frequency domain and which was saved under the Test and Train folders.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern and '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


##Performing the Analysis with the Codes
1. Relevant R programming codes which are used to perform this task, presented in run_analysis.R.
2. You need to unzip the zip folder and set the directory within the UCI HAR Dataset folder, and perform the analysis.
3. The codes reads transformed features variables, and relevant Activity variables and Subject variables from both test folder and train folder.
4. Also it reads features variable and Activity label variables from the root directory
5. It binds test and train cases together
6. Features variables are assigned as column names of the featured variables
7. Then, it extracts only the measurements related to the mean and standard deviation as it is interested in this analysis
8. Activity names are assigned to the Activity IDs to give descriptiveness to the activities
9. Extracted feature vector is merged with the Activities and Subject indicators to create a full dataset
10. Variable names of the data set are made with descriptive variable names
11. The dataset is grouped by Subject and Activity in order to get the average of each variable for each activity and each subject.
12. The mean summary data is the Tidy Dataset and which is written in a text file named as tidyData.txt. The tidy dataset will be saved in the working directory.


##Variables in the Tidy Dataset
Variables were assigned with descriptive names as much as possible in this analysis   
 [1] "Subject"                      
 [2] "Activity"                     
 [3] "timeBodyAccMeanInX"           
 [4] "timeBodyAccMeanInY"           
 [5] "timeBodyAccMeanInZ"           
 [6] "timeGravityAccMeanInX"        
 [7] "timeGravityAccMeanInY"        
 [8] "timeGravityAccMeanInZ"        
 [9] "timeBodyAccJerkMeanInX"       
[10] "timeBodyAccJerkMeanInY"       
[11] "timeBodyAccJerkMeanInZ"       
[12] "timeBodyGyroMeanInX"          
[13] "timeBodyGyroMeanInY"          
[14] "timeBodyGyroMeanInZ"          
[15] "timeBodyGyroJerkMeanInX"      
[16] "timeBodyGyroJerkMeanInY"      
[17] "timeBodyGyroJerkMeanInZ"      
[18] "timeBodyAccMagMean"           
[19] "timeGravityAccMagMean"        
[20] "timeBodyAccJerkMagMean"       
[21] "timeBodyGyroMagMean"          
[22] "timeBodyGyroJerkMagMean"      
[23] "freqBodyAccMeanInX"           
[24] "freqBodyAccMeanInY"           
[25] "freqBodyAccMeanInZ"           
[26] "freqBodyAccJerkMeanInX"       
[27] "freqBodyAccJerkMeanInY"       
[28] "freqBodyAccJerkMeanInZ"       
[29] "freqBodyGyroMeanInX"          
[30] "freqBodyGyroMeanInY"          
[31] "freqBodyGyroMeanInZ"          
[32] "freqBodyAccMagMean"           
[33] "freqBodyBodyAccJerkMagMean"   
[34] "freqBodyBodyGyroMagMean"      
[35] "freqBodyBodyGyroJerkMagMean"  
[36] "timeBodyAccStdDevInX"         
[37] "timeBodyAccStdDevInY"         
[38] "timeBodyAccStdDevInZ"         
[39] "timeGravityAccStdDevInX"      
[40] "timeGravityAccStdDevInY"      
[41] "timeGravityAccStdDevInZ"      
[42] "timeBodyAccJerkStdDevInX"     
[43] "timeBodyAccJerkStdDevInY"     
[44] "timeBodyAccJerkStdDevInZ"     
[45] "timeBodyGyroStdDevInX"        
[46] "timeBodyGyroStdDevInY"        
[47] "timeBodyGyroStdDevInZ"        
[48] "timeBodyGyroJerkStdDevInX"    
[49] "timeBodyGyroJerkStdDevInY"    
[50] "timeBodyGyroJerkStdDevInZ"    
[51] "timeBodyAccMagStdDev"         
[52] "timeGravityAccMagStdDev"      
[53] "timeBodyAccJerkMagStdDev"     
[54] "timeBodyGyroMagStdDev"        
[55] "timeBodyGyroJerkMagStdDev"    
[56] "freqBodyAccStdDevInX"         
[57] "freqBodyAccStdDevInY"         
[58] "freqBodyAccStdDevInZ"         
[59] "freqBodyAccJerkStdDevInX"     
[60] "freqBodyAccJerkStdDevInY"     
[61] "freqBodyAccJerkStdDevInZ"      
[62] "freqBodyGyroStdDevInX"         
[63] "freqBodyGyroStdDevInY"         
[64] "freqBodyGyroStdDevInZ"        
[65] "freqBodyAccMagStdDev"     
[66] "freqBodyBodyAccJerkMagStdDev"  
[67] "freqBodyBodyGyroMagStdDev"      
[68] "freqBodyBodyGyroJerkMagStdDev"  
[66] "freqBodyBodyAccJerkMagStdDev"   
[67] "freqBodyBodyGyroMagStdDev"     
[68] "freqBodyBodyGyroJerkMagStdDev"
