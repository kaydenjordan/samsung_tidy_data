# samsung_tidy_data
The R script, run_analysis.R, downloads the accelerometer and gyroscope smartphone data collected by Samsung and tidies the data. The resulting dataset contains 30 rows representing 30 subjects and 25 columns represent variables explained in the codebook below. R script contains more specific comments as to the each step of process.

Selection of Variables:
1. All variables containing "mean" or "std" were selected."
2. All variables containing "acc" and "mean" were selected and averaged for each row. The new average represent average mean acceleration as measured by the accelerometer.
3. All variables containing "acc" and "std" were selected and averaged for each row. The new average represent average std acceleration as measured by the accelerometer.
4. All variables containing "gyro" and "mean" were selected and averaged for each row. The new average represent average mean velocity as measured by the gyroscope.
5. All variables containing "gyro" and "std" were selected and averaged for each row. The new average represent average std velocity as measured by the gyroscope.

Summarization of the Variables:
1. Mean acceleration were averaged across activities such that for each activity and each subject, one mean acceleration was computed. 
2. Step 1 was repeated for std acceleration, mean velocity, and std velocity.
3. Data were restructured such that each row represents only one subject and each column represents only one variable.

Codebook:
1. Subject - subject identification number
2. Walking_mean_acceleration - average of all mean accelerometer measurments for walking activity
3. Walking_sd_acceleration - average of all std accelerometer measurments for walking activity
4. Walking_mean_velocity - average of all mean gyroscope measurments for walking activity
5. Walking_sd_velocity - average of all std gyroscope measurments for walking activity
6. Walking.Upstairs_mean_acceleration - average of all mean accelerometer measurments for walking upstairs activity
7. Walking.Upstairs_sd_acceleration - average of all std accelerometer measurments for walking upstairs activity
8. Walking.Upstairs_mean_velocity - average of all mean gyroscope measurments for walking upstairs activity
9. Walking.Upstairs_sd_velocity - average of all std gyroscope measurments for walking upstairs activity
10. Walking.Downstairs_mean_acceleration - average of all mean accelerometer measurments for walking downstairs activity
11. Walking.Downstairs_sd_acceleration - average of all std accelerometer measurments for walking upstairs activity
12. Walking.Downstairs_mean_velocity - average of all mean gyroscope measurments for walking upstairs activity
13. Walking.Downstairs_sd_velocity - average of all std gyroscope measurments for walking upstairs activity
14. Sitting_mean_acceleration - average of all mean accelerometer measurments for sitting activity
15. Sitting_sd_acceleration - average of all std accelerometer measurments for sitting activity
16. Sitting_mean_velocity - average of all mean gyroscope measurments for sitting activity
17. Sitting_sd_velocity - average of all std gyroscope measurments for sitting activity
18. Standing_mean_acceleration - average of all mean accelerometer measurments for standing activity
19. Standing_sd_acceleration - average of all std accelerometer measurments for standing activity
20. Standing_mean_velocity - average of all mean gyroscope measurments for standing activity
21. Standing_sd_velocity- average of all std gyroscope measurments for standing activity
22. Laying_mean_acceleration - average of all mean accelerometer measurments for laying activity
23. Laying_sd_acceleration - average of all std accelerometer measurments for laying activity
24. Laying_mean_velocity - average of all mean gyroscope measurments for laying activity
25. Laying_sd_velocity - average of all std gyroscope measurments for laying activity
