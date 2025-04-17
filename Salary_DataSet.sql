SELECT * 
FROM salary.salary_dataset;

CREATE TABLE salary_dummy 
LIKE salary_dataset ;

INSERT salary_dummy
SELECT *
FROM salary_dataset;

SELECT *
FROM salary_dummy;