-- Average length of stay by unit

SELECT * FROM admissions;

SELECT unit, COUNT(*) FROM admissions
	GROUP BY unit;
    
SELECT unit, 
ROUND( AVG( DATEDIFF(discharge_date, admit_date)), 2) 
   AS avg_length_of_stay,
   COUNT(*) AS admissions
FROM admissions
GROUP BY unit;

SELECT unit, 
	 ROUND( AVG( DATEDIFF(discharge_date, admit_date)),2 ) 
		AS avg_length_of_stay_days,
        COUNT(*) AS admissions
    FROM admissions
    GROUP BY unit
    ORDER BY avg_length_of_stay_days DESC; 