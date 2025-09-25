-- Query: 30 Day Readmissions Overall
-- Counts the number of admissions with readmissions within 30 days and calculates the precentage of readmissions

SELECT
   COUNT(readmissions.readmit_id) AS readmissions_within_30_days, 
   COUNT(admissions.admission_id) AS total_admissions, 
   ROUND(100 * COUNT(readmissions.readmit_id) / COUNT(admissions.admission_id), 2) AS readmission_rate_percent  
FROM admissions 
   LEFT JOIN readmissions 
   ON admissions.admission_id = readmissions.admission_id 
   AND readmit_date <= DATE_ADD(admissions.discharge_date, INTERVAL 30 DAY);
   
   