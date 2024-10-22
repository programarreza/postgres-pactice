-- Active: 1729142840375@@127.0.0.1@5432@ph
CREATE VIEW dept_avg_salary
AS
SELECT department_name,AVG(salary) FROM employees GROUP BY department_name

SELECT * FROM dept_avg_salary


CREATE VIEW test_view
AS
SELECT employee_name, salary, department_name FROM employees
	WHERE  department_name in (SELECT department_name FROM employees WHERE department_name LIKE '%R%');

SELECT * FROM test_view

SELECT * FROM test_view

SELECT * FROM test_view