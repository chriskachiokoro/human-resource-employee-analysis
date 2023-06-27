SELECT * FROM hr;

-- 1. what is the gender breakdown of employees in the company?

SELECT gender, COUNT(*) FROM hr
WHERE age >= 18 AND termdate = 0000-00-00
GROUP BY gender;


-- 2. what is the race/ethnicity breakdown of employees in the company?

SELECT race, COUNT(*) FROM hr
WHERE age >= 18 AND termdate = 0000-00-00
GROUP BY race;

-- 3. what is the age distribution of employees in the company?
SELECT 
CASE 
	WHEN age >= 18 AND age <= 24 THEN '18-24'
	WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+'
END AS age_group, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = 0000-00-00
GROUP BY age_group
ORDER BY age_group;

SELECT age,COUNT(*) FROM hr GROUP BY 1  ORDER BY 2 DESC;

    



-- 4. how many employees work at headquarters versus home locations?

SELECT location, COUNT(*) FROM hr
WHERE age >= 18 AND termdate = 0000-00-00
GROUP BY location;


-- 5. what is the average length of emplyment for employees who have been terminated?



SELECT ROUND(AVG(YEAR(termdate)-YEAR(hire_date)),0) FROM (SELECT * FROM hr WHERE age >18) AS hr1
WHERE YEAR(termdate) <> 0000 AND YEAR(termdate) < 2023;

-- 6. how does the gender distribution/count vary across department and job titles?

SELECT department, jobtitle, gender, COUNT(*) FROM hr WHERE age >= 18 AND termdate = 0000-00-00 GROUP BY department, jobtitle, gender ORDER BY 1,2,3;

-- 7. What is the distribution/count of job titles across the compnay?

SELECT jobtitle,COUNT(*) FROM hr WHERE age >= 18 AND termdate = 0000-00-00 GROUP BY jobtitle ORDER BY 2 DESC;

-- 8. which department has the highest turnover rate?
SELECT department, total_count, terminated_count, terminated_count AS termination_rate
FROM (
	SELECT department, COUNT(*) AS total_count,
    SUM(CASE WHEN termdate <> 0000-00-00 AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminated_count
    FROM hr
    WHERE age >= 18
    GROUP BY department) AS t
ORDER BY termination_rate DESC;

-- 9 What is the distribution/count of employees across locations by city and state?
SELECT location, location_city, location_state, COUNT(*) AS employee_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location, location_city, location_state
ORDER BY employee_count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
  year, 
  hires, 
  terminations,
  hires - terminations AS net_change,
  ROUND(((hires - terminations)/hires) * 100, 2) AS net_change_percent
FROM (
  SELECT 
    YEAR(hire_date) AS year,
    COUNT(*) AS hires,
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
  FROM hr
  WHERE age >= 18
  GROUP BY YEAR(hire_date)
  ) AS t
ORDER BY year ASC;





