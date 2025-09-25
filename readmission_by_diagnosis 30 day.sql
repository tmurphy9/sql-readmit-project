-- 30 day readmissions grouped by diagnosis

SELECT
   admissions.diagnosis,
   COUNT(readmissions.readmit_id) AS readmissions_within_30_days, 
   COUNT(admissions.admission_id) AS total_admissions, 
   ROUND(100 * COUNT(readmissions.readmit_id) / COUNT(admissions.admission_id), 2) AS readmission_rate_percent  
FROM admissions 
   LEFT JOIN readmissions 
   ON admissions.admission_id = readmissions.admission_id 
   AND readmit_date <= DATE_ADD(admissions.discharge_date, INTERVAL 30 DAY)
   WHERE admissions.unit = 'Med/Surg';