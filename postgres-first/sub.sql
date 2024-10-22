CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(50) NOT NULL,
	department_name VARCHAR(50),
	salary DECIMAL(10,2 ),
	hire_date DATE
)


INSERT INTO employees (employee_name, department_name, salary, hire_date)
VALUES 
('John Smith', 'Sales', 50000.00, '2022-01-10'),
('Jane Doe', 'Marketing', 60000.00, '2021-03-15'),
('Alice Johnson', 'IT', 75000.00, '2020-06-20'),
('Bob Brown', 'Finance', 80000.00, '2019-02-05'),
('Charlie Davis', 'HR', 55000.00, '2023-04-01'),
('Eve Martinez', 'Sales', 52000.00, '2022-05-10'),
('Frank Miller', 'Marketing', 61000.00, '2021-07-12'),
('Grace Wilson', 'IT', 76000.00, '2020-09-18'),
('Hank Thomas', 'Finance', 81000.00, '2019-11-11'),
('Isabel Garcia', 'HR', 57000.00, '2023-02-20'),
('Jack White', 'Sales', 53000.00, '2022-08-22'),
('Karen Moore', 'Marketing', 62000.00, '2021-10-30'),
('Liam Harris', 'IT', 78000.00, '2020-12-15'),
('Mia Young', 'Finance', 83000.00, '2019-05-18'),
('Noah Lee', 'HR', 59000.00, '2023-06-03'),
('Olivia Clark', 'Sales', 54000.00, '2022-09-12'),
('Paul Walker', 'Marketing', 63000.00, '2021-11-25'),
('Quinn Hall', 'IT', 79000.00, '2020-01-05'),
('Rachel Adams', 'Finance', 85000.00, '2019-07-29'),
('Sam Carter', 'HR', 61000.00, '2023-08-14'),
('Tina Lewis', 'Sales', 55000.00, '2022-10-19'),
('Uma Bell', 'Marketing', 64000.00, '2021-12-10'),
('Victor Wright', 'IT', 80000.00, '2020-03-03'),
('Wendy Scott', 'Finance', 86000.00, '2019-09-21'),
('Xander King', 'HR', 62000.00, '2023-11-15'),
('Yara Perez', 'Sales', 56000.00, '2022-12-05'),
('Zane Turner', 'Marketing', 65000.00, '2021-04-02'),
('Amber Ross', 'IT', 81000.00, '2020-05-14'),
('Ben Brooks', 'Finance', 87000.00, '2019-08-30'),
('Cathy Reed', 'HR', 63000.00, '2023-01-21');


-- Retrieved all employees whose salary is greater then the highest salary of the HR department 
SELECT MAX(salary) FROM employees WHERE department_name = 'HR' -- 63000

SELECT * FROM employees 
	WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_name = 'HR')


SELECT department_name, SUM(salary) FROM employees 
	GROUP BY department_name


SELECT * FROM -- outer-query/main-query
(SELECT department_name, SUM(salary) FROM employees 
	GROUP BY department_name) as sum_dept_salary -- sub query


SELECT employee_name, salary, department_name FROM employees
	WHERE  department_name in (SELECT department_name FROM employees WHERE department_name LIKE '%R%');