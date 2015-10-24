The Information in the data set is the mean of the features selected from the accelerometer and gyroscope 3-axial raw signals Time Acceleration X, Y, Z and Time Gyroscope X, Y, Z. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time Body Acceleration X, Y, Z and Time Gravity Acceleration X, Y, Z) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time Body Acceleration Jerk X, Y, Z and Time Body Gyroscope Jerk X, Y, Z). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm

(Time Body Acceleration Magnitud, Time Gravity Acceleration Magnitud, Time Body Acceleration Jerk Magnitud, Time Body Gyroscope Magnitud, Time Body Gyroscope Jerk Magnitud). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing Frecuency Body Acceleration X, Y, Z, Frecuency Body Acceleration Jerk X, Y, Z, Frecuency Body Gyroscope X, Y, Z, Frecuency Body Acceleration Jerk Magnitud, Frecuency Body Gyroscope Magnitud, Frecuency Body Gyroscope JerkMagnitud.

These signals were used to estimate variables of the feature vector for each pattern:  
X, Y, Z is used to denote 3-axial signals in the X, Y and Z directions.

From these signals several varibles were estimated in the original experiment but only the Mean and the Standard deviation were selected for this project.  The weighted average of the frequency in a signal window and additional vectors obtained by averaging the signals in a signal window sample were NOT included.

Finally the information was associated to the subject id and the Activity they were performing, and averages were calculated for each subject and each activity.


Column number | Label | Description
--------------|-------|------------
1 | Subject | An identifier of the subject who carried out the experiment
2 | Activity | WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING
3 | Time Body Acceleration Mean X | Average by Subject and Activity of the  Time Body Acceleration Mean X 
4 | Time Body Acceleration Mean Y | Average by Subject and Activity of the  Time Body Acceleration Mean Y 
5 | Time Body Acceleration Mean Z | Average by Subject and Activity of the  Time Body Acceleration Mean Z 
6 | Time Body Acceleration Standard Deviation X | Average by Subject and Activity of the  Time Body Acceleration Standard Deviation X 
7 | Time Body Acceleration Standard Deviation Y | Average by Subject and Activity of the  Time Body Acceleration Standard Deviation Y 
8 | Time Body Acceleration Standard Deviation Z | Average by Subject and Activity of the  Time Body Acceleration Standard Deviation Z 
9 | Time Gravity Acceleration Mean X | Average by Subject and Activity of the  Time Gravity Acceleration Mean X 
10 | Time Gravity Acceleration Mean Y | Average by Subject and Activity of the  Time Gravity Acceleration Mean Y 
11 | Time Gravity Acceleration Mean Z | Average by Subject and Activity of the  Time Gravity Acceleration Mean Z 
12 | Time Gravity Acceleration Standard Deviation X | Average by Subject and Activity of the  Time Gravity Acceleration Standard Deviation X 
13 | Time Gravity Acceleration Standard Deviation Y | Average by Subject and Activity of the  Time Gravity Acceleration Standard Deviation Y 
14 | Time Gravity Acceleration Standard Deviation Z | Average by Subject and Activity of the  Time Gravity Acceleration Standard Deviation Z 
15 | Time Body Acceleration Jerk Mean X | Average by Subject and Activity of the  Time Body Acceleration Jerk Mean X 
16 | Time Body Acceleration Jerk Mean Y | Average by Subject and Activity of the  Time Body Acceleration Jerk Mean Y 
17 | Time Body Acceleration Jerk Mean Z | Average by Subject and Activity of the  Time Body Acceleration Jerk Mean Z 
18 | Time Body Acceleration Jerk Standard Deviation X | Average by Subject and Activity of the  Time Body Acceleration Jerk Standard Deviation X 
19 | Time Body Acceleration Jerk Standard Deviation Y | Average by Subject and Activity of the  Time Body Acceleration Jerk Standard Deviation Y 
20 | Time Body Acceleration Jerk Standard Deviation Z | Average by Subject and Activity of the  Time Body Acceleration Jerk Standard Deviation Z 
21 | Time Body Gyroscope Mean X | Average by Subject and Activity of the  Time Body Gyroscope Mean X 
22 | Time Body Gyroscope Mean Y | Average by Subject and Activity of the  Time Body Gyroscope Mean Y 
23 | Time Body Gyroscope Mean Z | Average by Subject and Activity of the  Time Body Gyroscope Mean Z 
24 | Time Body Gyroscope Standard Deviation X | Average by Subject and Activity of the  Time Body Gyroscope Standard Deviation X 
25 | Time Body Gyroscope Standard Deviation Y | Average by Subject and Activity of the  Time Body Gyroscope Standard Deviation Y 
26 | Time Body Gyroscope Standard Deviation Z | Average by Subject and Activity of the  Time Body Gyroscope Standard Deviation Z 
27 | Time Body Gyroscope Jerk Mean X | Average by Subject and Activity of the  Time Body Gyroscope Jerk Mean X 
28 | Time Body Gyroscope Jerk Mean Y | Average by Subject and Activity of the  Time Body Gyroscope Jerk Mean Y 
29 | Time Body Gyroscope Jerk Mean Z | Average by Subject and Activity of the  Time Body Gyroscope Jerk Mean Z 
30 | Time Body Gyroscope Jerk Standard Deviation X | Average by Subject and Activity of the  Time Body Gyroscope Jerk Standard Deviation X 
31 | Time Body Gyroscope Jerk Standard Deviation Y | Average by Subject and Activity of the  Time Body Gyroscope Jerk Standard Deviation Y 
32 | Time Body Gyroscope Jerk Standard Deviation Z | Average by Subject and Activity of the  Time Body Gyroscope Jerk Standard Deviation Z 
33 | Time Body Acceleration Magnitude Mean | Average by Subject and Activity of the  Time Body Acceleration Magnitude Mean 
34 | Time Body Acceleration Magnitude Standard Deviation | Average by Subject and Activity of the  Time Body Acceleration Magnitude Standard Deviation 
35 | Time Gravity Acceleration Magnitude Mean | Average by Subject and Activity of the  Time Gravity Acceleration Magnitude Mean 
36 | Time Gravity Acceleration Magnitude Standard Deviation | Average by Subject and Activity of the  Time Gravity Acceleration Magnitude Standard Deviation 
37 | Time Body Acceleration Jerk Magnitude Mean | Average by Subject and Activity of the  Time Body Acceleration Jerk Magnitude Mean 
38 | Time Body Acceleration Jerk Magnitude Standard Deviation | Average by Subject and Activity of the  Time Body Acceleration Jerk Magnitude Standard Deviation 
39 | Time Body Gyroscope Magnitude Mean | Average by Subject and Activity of the  Time Body Gyroscope Magnitude Mean 
40 | Time Body Gyroscope Magnitude Standard Deviation | Average by Subject and Activity of the  Time Body Gyroscope Magnitude Standard Deviation 
41 | Time Body Gyroscope Jerk Magnitude Mean | Average by Subject and Activity of the  Time Body Gyroscope Jerk Magnitude Mean 
42 | Time Body Gyroscope Jerk Magnitude Standard Deviation | Average by Subject and Activity of the  Time Body Gyroscope Jerk Magnitude Standard Deviation 
43 | Frequency Body Acceleration Mean X | Average by Subject and Activity of the  Frequency Body Acceleration Mean X 
44 | Frequency Body Acceleration Mean Y | Average by Subject and Activity of the  Frequency Body Acceleration Mean Y 
45 | Frequency Body Acceleration Mean Z | Average by Subject and Activity of the  Frequency Body Acceleration Mean Z 
46 | Frequency Body Acceleration Standard Deviation X | Average by Subject and Activity of the  Frequency Body Acceleration Standard Deviation X 
47 | Frequency Body Acceleration Standard Deviation Y | Average by Subject and Activity of the  Frequency Body Acceleration Standard Deviation Y 
48 | Frequency Body Acceleration Standard Deviation Z | Average by Subject and Activity of the  Frequency Body Acceleration Standard Deviation Z 
49 | Frequency Body Acceleration Jerk Mean X | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Mean X 
50 | Frequency Body Acceleration Jerk Mean Y | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Mean Y 
51 | Frequency Body Acceleration Jerk Mean Z | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Mean Z 
52 | Frequency Body Acceleration Jerk Standard Deviation X | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Standard Deviation X 
53 | Frequency Body Acceleration Jerk Standard Deviation Y | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Standard Deviation Y 
54 | Frequency Body Acceleration Jerk Standard Deviation Z | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Standard Deviation Z 
55 | Frequency Body Gyroscope Mean X | Average by Subject and Activity of the  Frequency Body Gyroscope Mean X 
56 | Frequency Body Gyroscope Mean Y | Average by Subject and Activity of the  Frequency Body Gyroscope Mean Y 
57 | Frequency Body Gyroscope Mean Z | Average by Subject and Activity of the  Frequency Body Gyroscope Mean Z 
58 | Frequency Body Gyroscope Standard Deviation X | Average by Subject and Activity of the  Frequency Body Gyroscope Standard Deviation X 
59 | Frequency Body Gyroscope Standard Deviation Y | Average by Subject and Activity of the  Frequency Body Gyroscope Standard Deviation Y 
60 | Frequency Body Gyroscope Standard Deviation Z | Average by Subject and Activity of the  Frequency Body Gyroscope Standard Deviation Z 
61 | Frequency Body Acceleration Magnitude Mean | Average by Subject and Activity of the  Frequency Body Acceleration Magnitude Mean 
62 | Frequency Body Acceleration Magnitude Standard Deviation | Average by Subject and Activity of the  Frequency Body Acceleration Magnitude Standard Deviation 
63 | Frequency Body Acceleration Jerk Magnitude Mean | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Magnitude Mean 
64 | Frequency Body Acceleration Jerk Magnitude Standard Deviation | Average by Subject and Activity of the  Frequency Body Acceleration Jerk Magnitude Standard Deviation 
65 | Frequency Body Gyroscope Magnitude Mean | Average by Subject and Activity of the  Frequency Body Gyroscope Magnitude Mean 
66 | Frequency Body Gyroscope Magnitude Standard Deviation | Average by Subject and Activity of the  Frequency Body Gyroscope Magnitude Standard Deviation 
67 | Frequency Body Gyroscope Jerk Magnitude Mean | Average by Subject and Activity of the  Frequency Body Gyroscope Jerk Magnitude Mean 
68 | Frequency Body Gyroscope Jerk Magnitude Standard Deviation | Average by Subject and Activity of the  Frequency Body Gyroscope Jerk Magnitude Standard Deviation 
