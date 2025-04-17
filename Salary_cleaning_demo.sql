SELECT * 
FROM salary.salary_dummy;

ALTER TABLE salary_dummy
RENAME COLUMN MyUnknownColumn TO Serial_number;


SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY Serial_number, YearsExperience, Salary
) AS Values_seen
FROM salary_dummy;


-- WITH duplicate_cte AS 
-- (
-- 	SELECT *,
-- ROW_NUMBER() OVER(
-- 	PARTITION BY Serial_number, YearsExperience, Salary
-- ) 
-- AS Values_seen
-- 	FROM salary_dummy
-- )

-- SELECT *
-- FROM salary_dummy
-- WHERE Serial_number = 1;

SELECT DISTINCT Serial_number,YearsExperience
FROM salary_dummy
ORDER BY 1;


-- to see null values

SELECT *
FROM salary_dummy
WHERE YearsExperience IS NULL
OR YearsExperience = ' ';

SELECT *
FROM salary_dummy
WHERE salary IS NULL
OR YearsExperience = ' ';

-- exploratory Data Analysis

SELECT MIN(salary), MAX(salary)
FROM salary_dummy;


SELECT `YearsExperience`, SUM(`Salary`) AS total_salary
FROM salary_dummy
GROUP BY `YearsExperience`
ORDER BY total_salary DESC;

-- Rolling Off of salary --

SELECT 
  Serial_Number,
  YearsExperience,
  Salary,
  SUM(Salary) OVER (
    PARTITION BY Serial_Number
    ORDER BY YearsExperience
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS rolling_total
FROM salary_dummy;

-- to understand :

-- Part					|			Meaning
-- ROWS 				| 	Operates on physical rows (not value ranges or groups)
-- UNBOUNDED PRECEDING  | 	Start from the first row in the partition or result set
-- CURRENT ROW 			| 	End with the current row being processed





