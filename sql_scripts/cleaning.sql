CREATE DATABASE human_resource;

USE human_resource;

SELECT * FROM hr;
-- 1. Explore Birthdate column
DESCRIBE hr;

 -- set sql safe updates to 0 
 SET sql_safe_updates = 0;
 SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
 SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
 
 -- birthdate has inconsitent date 
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
    ELSE null
END;
-- 2. Change birthdate data type from text/string to date data type
-- ===================================================================
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;


SELECT birthdate FROM hr;

-- 3. Explore the hire_date column.
-- ================================
SELECT hire_date FROM hr; 
-- hrie_date has inconsistent date format, hence needs cleaning.
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

-- 4. Change hire_date data type from text/string to data data type.alter
-- =======================================================================

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- 5. Explore the termdate column.
-- ================================
DESCRIBE hr;

SELECT termdate FROM hr;


-- Fill missing values
UPDATE hr
SET termdate = '0000-00-00 00:00:00 UTC'
WHERE termdate = '';


-- Change termdate format.
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'));

-- 6. Change termdate data type from text/string to data type.alter
-- ================================================================

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

DESCRIBE hr;


-- 7. Add a column for Age
-- ========================
ALTER TABLE hr ADD COLUMN age INT;

DESCRIBE hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT age FROM hr;

-- Check for wrong Age
SELECT birthdate, age FROM hr
WHERE age < 0;

-- Count number of rows of age less than 18 
SELECT COUNT(*) FROM hr
WHERE age < 18;

    
    
    