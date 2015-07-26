
### Reference and Source data

Data Set Information:

* [Source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* [Home page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

From the source description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. timehe experiments have been video-recorded to label the data manually. timehe obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). timehe sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. timehe gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. freqrom each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For more details about the variables - [source README file](README-source.txt)

#### Citation: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


#### Data Dictionary

A full description of variables from the source dataset is included [here](features-info-source.txt). 

From these variables, subject ID and calculations of mean and standard deviation were selected to be part of the tidy dataset.

To improve readbility:
 
* Column names were re-labeled with 'Mean' and 'Std' 
* 't' and 'f' prefix were replaced by 'time' and 'freq' respectively (for timed and frequency measurement)
* The full activity name was added to the dataset instead of Activity ID

1. **ActivityName**: Full name of activity tracked
2. **SubjectID**: Identifier for subject
3. timeBodyAccMeanX
4. timeBodyAccMeanY
5. timeBodyAccMeanZ
6. timeBodyAccStdX
7. timeBodyAccStdY
8. timeBodyAccStdZ
9. timeGravityAccMeanX
10. timeGravityAccMeanY
11. timeGravityAccMeanZ
12. timeGravityAccStdX
13. timeGravityAccStdY
14. timeGravityAccStdZ
15. timeBodyAccJerkMeanX
16. timeBodyAccJerkMeanY
17. timeBodyAccJerkMeanZ
18. timeBodyAccJerkStdX
19. timeBodyAccJerkStdY
20. timeBodyAccJerkStdZ
21. timeBodyGyroMeanX
22. timeBodyGyroMeanY
23. timeBodyGyroMeanZ
24. timeBodyGyroStdX
25. timeBodyGyroStdY
26. timeBodyGyroStdZ
27. timeBodyGyroJerkMeanX
28. timeBodyGyroJerkMeanY
29. timeBodyGyroJerkMeanZ
30. timeBodyGyroJerkStdX
31. timeBodyGyroJerkStdY
32. timeBodyGyroJerkStdZ
33. timeBodyAccMagMean
34. timeBodyAccMagStd
35. timeGravityAccMagMean
36. timeGravityAccMagStd
37. timeBodyAccJerkMagMean
38. timeBodyAccJerkMagStd
39. timeBodyGyroMagMean
40. timeBodyGyroMagStd
41. timeBodyGyroJerkMagMean
42. timeBodyGyroJerkMagStd
43. freqBodyAccMeanX
44. freqBodyAccMeanY
45. freqBodyAccMeanZ
46. freqBodyAccStdX
47. freqBodyAccStdY
48. freqBodyAccStdZ
49. freqBodyAccJerkMeanX
50. freqBodyAccJerkMeanY
51. freqBodyAccJerkMeanZ
52. freqBodyAccJerkStdX
53. freqBodyAccJerkStdY
54. freqBodyAccJerkStdZ
55. freqBodyGyroMeanX
56. freqBodyGyroMeanY
57. freqBodyGyroMeanZ
58. freqBodyGyroStdX
59. freqBodyGyroStdY
60. freqBodyGyroStdZ
61. freqBodyAccMagMean
62. freqBodyAccMagStd
63. freqBodyBodyAccJerkMagMean
64. freqBodyBodyAccJerkMagStd
65. freqBodyBodyGyroMagMean
66. freqBodyBodyGyroMagStd
67. freqBodyBodyGyroJerkMagMean
68. freqBodyBodyGyroJerkMagStd
