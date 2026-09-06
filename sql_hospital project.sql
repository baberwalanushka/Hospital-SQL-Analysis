create database hospital_info;

use hospital_info;



-- Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(`Patients Count`) AS total_patients
FROM hospital_data;

-- Retrieve the average count of doctors available in each hospital. 
SELECT AVG(`Doctors Count`) AS average_doctors
FROM hospital_data;

-- Find the top 3 hospital departments that have the highest number of patients.
SELECT `Department`,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Department`
ORDER BY total_patients DESC
LIMIT 3;

-- Identify the hospital that recorded the highest medical expenses. 
SELECT `ï»¿Hospital Name`,
       `Medical Expenses`
FROM hospital_data
ORDER BY `Medical Expenses` DESC
LIMIT 1;

-- Calculate the average medical expenses per day for each hospital.
SELECT `Admission Date`, `Discharge Date`
FROM hospital_data
LIMIT 5;SELECT `ï»¿Hospital Name`,
       AVG(
           `Medical Expenses` /
           DATEDIFF(
               STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
               STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
           )
       ) AS avg_expenses_per_day
FROM hospital_data
GROUP BY `ï»¿Hospital Name`;

-- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT `ï»¿Hospital Name`,
       `Admission Date`,
       `Discharge Date`,
       DATEDIFF(
           STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       ) AS length_of_stay
FROM hospital_data
ORDER BY length_of_stay DESC
LIMIT 1;

-- Count the total number of patients treated in each city. 
SELECT `Location`,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Location`;


-- Calculate the average number of days patients spend in each department.
SELECT `Department`,
       AVG(
           DATEDIFF(
               STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
               STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
           )
       ) AS average_days
FROM hospital_data
GROUP BY `Department`;

-- Find the department with the least number of patients. 
SELECT `Department`,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY `Department`
ORDER BY total_patients ASC
LIMIT 1;

-- Group the data by month and calculate the total medical expenses for each month. 
SELECT DATE_FORMAT(
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y'),
           '%Y-%m'
       ) AS month,
       SUM(`Medical Expenses`) AS total_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;