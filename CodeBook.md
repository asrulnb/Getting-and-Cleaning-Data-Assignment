# Code Book for Coursera Data Science Course: Getting and Cleaning Data Assignment

- UCI HAR Dataset originaly published in several text files in two Folders, "Test" and "Training" data sets
- All the data is merged into one data table for analysis in this assignment
- The Merged Raw data composes of 10299 rows and 563 columns
- The columns needed for the analysis consist of "Mean" (mean) and "Standard Deviation" (std) for each measurement
- After extracting the needed columns, the data consist of 88 columns with 10299 rows of record

[ Original Column Names ]
 [1] "Subject"                             
 [2] "Activity"                            
 [3] "tBodyAcc-mean()-X"                   
 [4] "tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                   
 [6] "tBodyAcc-std()-X"                    
 [7] "tBodyAcc-std()-Y"                    
 [8] "tBodyAcc-std()-Z"                    
 [9] "tGravityAcc-mean()-X"                
[10] "tGravityAcc-mean()-Y"                
[11] "tGravityAcc-mean()-Z"                
[12] "tGravityAcc-std()-X"                 
[13] "tGravityAcc-std()-Y"                 
[14] "tGravityAcc-std()-Z"                 
[15] "tBodyAccJerk-mean()-X"               
[16] "tBodyAccJerk-mean()-Y"               
[17] "tBodyAccJerk-mean()-Z"               
[18] "tBodyAccJerk-std()-X"                
[19] "tBodyAccJerk-std()-Y"                
[20] "tBodyAccJerk-std()-Z"                
[21] "tBodyGyro-mean()-X"                  
[22] "tBodyGyro-mean()-Y"                  
[23] "tBodyGyro-mean()-Z"                  
[24] "tBodyGyro-std()-X"                   
[25] "tBodyGyro-std()-Y"                   
[26] "tBodyGyro-std()-Z"                   
[27] "tBodyGyroJerk-mean()-X"              
[28] "tBodyGyroJerk-mean()-Y"              
[29] "tBodyGyroJerk-mean()-Z"              
[30] "tBodyGyroJerk-std()-X"               
[31] "tBodyGyroJerk-std()-Y"               
[32] "tBodyGyroJerk-std()-Z"               
[33] "tBodyAccMag-mean()"                  
[34] "tBodyAccMag-std()"                   
[35] "tGravityAccMag-mean()"               
[36] "tGravityAccMag-std()"                
[37] "tBodyAccJerkMag-mean()"              
[38] "tBodyAccJerkMag-std()"               
[39] "tBodyGyroMag-mean()"                 
[40] "tBodyGyroMag-std()"                  
[41] "tBodyGyroJerkMag-mean()"             
[42] "tBodyGyroJerkMag-std()"              
[43] "fBodyAcc-mean()-X"                   
[44] "fBodyAcc-mean()-Y"                   
[45] "fBodyAcc-mean()-Z"                   
[46] "fBodyAcc-std()-X"                    
[47] "fBodyAcc-std()-Y"                    
[48] "fBodyAcc-std()-Z"                    
[49] "fBodyAcc-meanFreq()-X"               
[50] "fBodyAcc-meanFreq()-Y"               
[51] "fBodyAcc-meanFreq()-Z"               
[52] "fBodyAccJerk-mean()-X"               
[53] "fBodyAccJerk-mean()-Y"               
[54] "fBodyAccJerk-mean()-Z"               
[55] "fBodyAccJerk-std()-X"                
[56] "fBodyAccJerk-std()-Y"                
[57] "fBodyAccJerk-std()-Z"                
[58] "fBodyAccJerk-meanFreq()-X"           
[59] "fBodyAccJerk-meanFreq()-Y"           
[60] "fBodyAccJerk-meanFreq()-Z"           
[61] "fBodyGyro-mean()-X"                  
[62] "fBodyGyro-mean()-Y"                  
[63] "fBodyGyro-mean()-Z"                  
[64] "fBodyGyro-std()-X"                   
[65] "fBodyGyro-std()-Y"                   
[66] "fBodyGyro-std()-Z"                   
[67] "fBodyGyro-meanFreq()-X"              
[68] "fBodyGyro-meanFreq()-Y"              
[69] "fBodyGyro-meanFreq()-Z"              
[70] "fBodyAccMag-mean()"                  
[71] "fBodyAccMag-std()"                   
[72] "fBodyAccMag-meanFreq()"              
[73] "fBodyBodyAccJerkMag-mean()"          
[74] "fBodyBodyAccJerkMag-std()"           
[75] "fBodyBodyAccJerkMag-meanFreq()"      
[76] "fBodyBodyGyroMag-mean()"             
[77] "fBodyBodyGyroMag-std()"              
[78] "fBodyBodyGyroMag-meanFreq()"         
[79] "fBodyBodyGyroJerkMag-mean()"         
[80] "fBodyBodyGyroJerkMag-std()"          
[81] "fBodyBodyGyroJerkMag-meanFreq()"     
[82] "angle(tBodyAccMean,gravity)"         
[83] "angle(tBodyAccJerkMean),gravityMean)"         
[84] "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)"         
[86] "angle(X,gravityMean)"                
[87] "angle(Y,gravityMean)"                
[88] "angle(Z,gravityMean)"

- In order to use "dplyr" select functions on the merged Data Frames, the name of the columns needed to change
- The following functions was used :
	valid_names <- make.names(names = t(featureList[2]),unique = TRUE,allow_ = TRUE)
- Final dataset looks like the following
	
[ Final Column Names ]
 [1] "Subject"		1
		The ID of the Test Subject (person doing the activities). Starts from number 1 to 30.
		1..30
 
 [2] "Activity" 	1
		The Type of Activity that the Test Subject was doing when the data is measured. Starts from 1 to 6.
		The Original dataset have it written as Integer which starts from 1 to 6.
		When creating a Tiny Data, this value converted into their corrensponding name as listed in "activity_labels.txt" file
		1. LAYING
		2. SITTING
		3. STANDING
		4. WALKING
		5. WALKING_DOWNSTAIRS
		6. WALKING_UPSTAIRS
		
 [3] "TimeBodyAccelerometerMeanX"
		Signed Numerical numbers showing the Mean reading of Body Acceleration in X Axis
		-0.99999999..0.99999999
		
 [4] "TimeBodyAccelerometerMeanY"
		Signed Numerical numbers showing the Mean reading of Body Acceleration in Y Axis
		-0.99999999..0.99999999
		
 [5] "TimeBodyAccelerometerMeanZ"                          
 		Signed Numerical numbers showing the Mean reading of Body Acceleration in Z Axis
		-0.99999999..0.99999999
		
 [6] "TimeGravityAccelerometerMeanX"                       
 		Signed Numerical numbers showing the Mean reading of Gravity Acceleration in X Axis
		-0.99999999..0.99999999
		
 [7] "TimeGravityAccelerometerMeanY"  
 		Signed Numerical numbers showing the Mean reading of Gravity Acceleration in Y Axis
		-0.99999999..0.99999999
		
 [8] "TimeGravityAccelerometerMeanZ"                       
  		Signed Numerical numbers showing the Mean reading of Gravity Acceleration in Z Axis
		-0.99999999..0.99999999
		
 [9] "TimeBodyAccelerometerJerkMeanX"                      
[10] "TimeBodyAccelerometerJerkMeanY"                      
[11] "TimeBodyAccelerometerJerkMeanZ"                      
[12] "TimeBodyGyroscopeMeanX"                              
[13] "TimeBodyGyroscopeMeanY"                              
[14] "TimeBodyGyroscopeMeanZ"                              
[15] "TimeBodyGyroscopeJerkMeanX"                          
[16] "TimeBodyGyroscopeJerkMeanY"                          
[17] "TimeBodyGyroscopeJerkMeanZ"                          
[18] "TimeBodyAccelerometerMagnitudeMean"                  
[19] "TimeGravityAccelerometerMagnitudeMean"               
[20] "TimeBodyAccelerometerJerkMagnitudeMean"              
[21] "TimeBodyGyroscopeMagnitudeMean"                      
[22] "TimeBodyGyroscopeJerkMagnitudeMean"                  
[23] "FrequencyBodyAccelerometerMeanX"                     
[24] "FrequencyBodyAccelerometerMeanY"                     
[25] "FrequencyBodyAccelerometerMeanZ"                     
[26] "FrequencyBodyAccelerometerMeanFrequencyX"            
[27] "FrequencyBodyAccelerometerMeanFrequencyY"            
[28] "FrequencyBodyAccelerometerMeanFrequencyZ"            
[29] "FrequencyBodyAccelerometerJerkMeanX"                 
[30] "FrequencyBodyAccelerometerJerkMeanY"                 
[31] "FrequencyBodyAccelerometerJerkMeanZ"                 
[32] "FrequencyBodyAccelerometerJerkMeanFrequencyX"        
[33] "FrequencyBodyAccelerometerJerkMeanFrequencyY"        
[34] "FrequencyBodyAccelerometerJerkMeanFrequencyZ"        
[35] "FrequencyBodyGyroscopeMeanX"                         
[36] "FrequencyBodyGyroscopeMeanY"                         
[37] "FrequencyBodyGyroscopeMeanZ"                         
[38] "FrequencyBodyGyroscopeMeanFrequencyX"                
[39] "FrequencyBodyGyroscopeMeanFrequencyY"                
[40] "FrequencyBodyGyroscopeMeanFrequencyZ"                
[41] "FrequencyBodyAccelerometerMagnitudeMean"             
[42] "FrequencyBodyAccelerometerMagnitudeMeanFrequency"    
[43] "FrequencyBodyAccelerometerJerkMagnitudeMean"         
[44] "FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency"
[45] "FrequencyBodyGyroscopeMagnitudeMean"                 
[46] "FrequencyBodyGyroscopeMagnitudeMeanFrequency"        
[47] "FrequencyBodyGyroscopeJerkMagnitudeMean"             
[48] "FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency"    
[49] "AngelTimeBodyAccelerometerMeanGravity"               
[50] "AngelTimeBodyAccelerometerJerkMeanGravityMean"       
[51] "AngelTimeBodyGyroscopeMeanGravityMean"               
[52] "AngelTimeBodyGyroscopeJerkMeanGravityMean"           
[53] "AngelXGravityMean"                                   
[54] "AngelYGravityMean"                                   
[55] "AngelZGravityMean"                                   
[56] "TimeBodyAccelerometerStdX"                           
[57] "TimeBodyAccelerometerStdY"                           
[58] "TimeBodyAccelerometerStdZ"                           
[59] "TimeGravityAccelerometerStdX"                        
[60] "TimeGravityAccelerometerStdY"                        
[61] "TimeGravityAccelerometerStdZ"                        
[62] "TimeBodyAccelerometerJerkStdX"                       
[63] "TimeBodyAccelerometerJerkStdY"                       
[64] "TimeBodyAccelerometerJerkStdZ"                       
[65] "TimeBodyGyroscopeStdX"                               
[66] "TimeBodyGyroscopeStdY"                               
[67] "TimeBodyGyroscopeStdZ"                               
[68] "TimeBodyGyroscopeJerkStdX"                           
[69] "TimeBodyGyroscopeJerkStdY"                           
[70] "TimeBodyGyroscopeJerkStdZ"                           
[71] "TimeBodyAccelerometerMagnitudeStd"                   
[72] "TimeGravityAccelerometerMagnitudeStd"                
[73] "TimeBodyAccelerometerJerkMagnitudeStd"               
[74] "TimeBodyGyroscopeMagnitudeStd"                       
[75] "TimeBodyGyroscopeJerkMagnitudeStd"                   
[76] "FrequencyBodyAccelerometerStdX"                      
[77] "FrequencyBodyAccelerometerStdY"                      
[78] "FrequencyBodyAccelerometerStdZ"                      
[79] "FrequencyBodyAccelerometerJerkStdX"                  
[80] "FrequencyBodyAccelerometerJerkStdY"                  
[81] "FrequencyBodyAccelerometerJerkStdZ"                  
[82] "FrequencyBodyGyroscopeStdX"                          
[83] "FrequencyBodyGyroscopeStdY"                          
[84] "FrequencyBodyGyroscopeStdZ"                          
[85] "FrequencyBodyAccelerometerMagnitudeStd"              
[86] "FrequencyBodyAccelerometerJerkMagnitudeStd"          
[87] "FrequencyBodyGyroscopeMagnitudeStd"                  
[88] "FrequencyBodyGyroscopeJerkMagnitudeStd" 
