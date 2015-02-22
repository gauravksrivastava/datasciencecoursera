---
title: "CodeBook.md"
author: "Gaurav Srivastava"
date: "February 21, 2015"
---

## **Experimental design and background** 
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
1. WALKING 
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS
4. SITTING 
5. STANDING 
6. LAYING 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 


##**Raw data**  
There are three sets of data  

* Subject - subject_<>.txt (<> denotes train and test)
* Activity - y_<>.txt (<> denotes train and test)
* Measurement - X_<>.txt (<> denotes train and test)  

Measurement consists of a 561 length vector for each subject for each activity. Some variables in this vector are mentioned below.  

1 tBodyAcc-mean()-X    
2 tBodyAcc-mean()-Y  
3 tBodyAcc-mean()-Z  
4 tBodyAcc-std()-X  
5 tBodyAcc-std()-Y  
6 tBodyAcc-std()-Z  
7 tBodyAcc-mad()-X  
8 tBodyAcc-mad()-Y  
9 tBodyAcc-mad()-Z  
10 tBodyAcc-max()-X  
...  
...  
...  
...  
561 angle(Z,gravityMean)

However, from this universe of 561 variables, only 79 variables are of interest (containing 'mean' and 'std' in the variable name). These are listed below
 
1 tBodyAcc-mean()-X  
2 tBodyAcc-mean()-Y  
3	tBodyAcc-mean()-Z  
4	tBodyAcc-std()-X  
5	tBodyAcc-std()-Y  
6	tBodyAcc-std()-Z  
7	tGravityAcc-mean()-X  
8	tGravityAcc-mean()-Y  
9	tGravityAcc-mean()-Z  
10	tGravityAcc-std()-X  
11	tGravityAcc-std()-Y  
12	tGravityAcc-std()-Z  
13	tBodyAccJerk-mean()-X  
14	tBodyAccJerk-mean()-Y  
15	tBodyAccJerk-mean()-Z  
16	tBodyAccJerk-std()-X  
17	tBodyAccJerk-std()-Y  
18	tBodyAccJerk-std()-Z  
19	tBodyGyro-mean()-X  
20	tBodyGyro-mean()-Y  
21	tBodyGyro-mean()-Z  
22	tBodyGyro-std()-X  
23	tBodyGyro-std()-Y  
24	tBodyGyro-std()-Z  
25	tBodyGyroJerk-mean()-X  
26	tBodyGyroJerk-mean()-Y  
27	tBodyGyroJerk-mean()-Z  
28	tBodyGyroJerk-std()-X  
29	tBodyGyroJerk-std()-Y  
30	tBodyGyroJerk-std()-Z  
31	tBodyAccMag-mean()  
32	tBodyAccMag-std()  
33	tGravityAccMag-mean()  
34	tGravityAccMag-std()  
35	tBodyAccJerkMag-mean()  
36	tBodyAccJerkMag-std()  
37	tBodyGyroMag-mean()  
38	tBodyGyroMag-std()  
39	tBodyGyroJerkMag-mean()  
40	tBodyGyroJerkMag-std()  
41	fBodyAcc-mean()-X  
42	fBodyAcc-mean()-Y  
43	fBodyAcc-mean()-Z  
44	fBodyAcc-std()-X  
45	fBodyAcc-std()-Y  
46	fBodyAcc-std()-Z  
47	fBodyAcc-meanFreq()-X  
48	fBodyAcc-meanFreq()-Y  
49	fBodyAcc-meanFreq()-Z  
50	fBodyAccJerk-mean()-X  
51	fBodyAccJerk-mean()-Y  
52	fBodyAccJerk-mean()-Z  
53	fBodyAccJerk-std()-X  
54	fBodyAccJerk-std()-Y  
55	fBodyAccJerk-std()-Z  
56	fBodyAccJerk-meanFreq()-X  
57	fBodyAccJerk-meanFreq()-Y  
58	fBodyAccJerk-meanFreq()-Z  
59	fBodyGyro-mean()-X  
60	fBodyGyro-mean()-Y  
61	fBodyGyro-mean()-Z  
62	fBodyGyro-std()-X  
63	fBodyGyro-std()-Y  
64	fBodyGyro-std()-Z  
65	fBodyGyro-meanFreq()-X  
66	fBodyGyro-meanFreq()-Y  
67	fBodyGyro-meanFreq()-Z  
68	fBodyAccMag-mean()  
69	fBodyAccMag-std()  
70	fBodyAccMag-meanFreq()  
71	fBodyBodyAccJerkMag-mean()  
72	fBodyBodyAccJerkMag-std()  
73	fBodyBodyAccJerkMag-meanFreq()  
74	fBodyBodyGyroMag-mean()  
75	fBodyBodyGyroMag-std()  
76	fBodyBodyGyroMag-meanFreq()  
77	fBodyBodyGyroJerkMag-mean()  
78	fBodyBodyGyroJerkMag-std()  
79	fBodyBodyGyroJerkMag-meanFreq()  

This above observation data is binded with the subject and activity data which results in a (10229 obs. * 81 variables) data frame.  

##**Processed data** 
The tidy data ensures the following

1. The activity names are used instead of numerals 1 through 6  
2. Each column contains one variable  
3. Each row contains one observation  
4. Each column has a name

The tidy (summarized) data is extracted to a "tidydataset.txt" files which is a (180 obs. * 81 variables) data frame.





