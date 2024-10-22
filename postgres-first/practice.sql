-- CREATE EMPLOYEE TABLE
CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(50),
	department_id INT REFERENCES departments(department_id),
	salary DECIMAL(10, 2),
	hire_date DATE
)

-- CREATE EMPLOYEE TABLE DATA
INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('John Doe', 1, 55000.00, '2020-05-15'),
('Jane Smith', 2, 62000.00, '2019-08-22'),
('Robert Johnson', 1, 58000.00, '2021-02-18'),
('Emily Davis', 3, 72000.00, '2018-12-10'),
('Michael Brown', 2, 67000.00, '2020-07-05'),
('Sarah Wilson', 4, 54000.00, '2021-11-23'),
('David Martinez', 1, 63000.00, '2017-04-03'),
('Jessica Garcia', 3, 75000.00, '2019-09-29'),
('Daniel Rodriguez', 2, 59000.00, '2020-10-12'),
('Olivia Lee', 4, 53000.00, '2022-01-15'),
('James Walker', 1, 51000.00, '2021-03-09'),
('Sophia Hall', 2, 68000.00, '2018-06-25'),
('Christopher Young', 3, 80000.00, '2017-02-15'),
('Isabella King', 4, 71000.00, '2019-05-20'),
('Andrew Scott', 1, 57000.00, '2020-09-11'),
('Charlotte Wright', 2, 66000.00, '2021-07-17'),
('Joseph Harris', 3, 81000.00, '2022-04-08'),
('Amelia Lewis', 4, 76000.00, '2020-12-14'),
('Alexander Adams', 1, 60000.00, '2018-10-30'),
('Mia Baker', 2, 64000.00, '2019-03-06');


-- INSERT DEPARTMENTS TABLE
CREATE TABLE departments (
	department_id SERIAl PRIMARY KEY,
	department_name VARCHAR(50)
)

-- INSERT DEPARTMENTS TABLE DATA
INSERT INTO departments (department_name)
VALUES
('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Custom support'),
('Administration'),
('Research'),
('Quality Assurance');

SELECT * FROM employees

-- JOIN EMPLOYEES & DEPARTMENTS TABLE
SELECT * FROM employees
	JOIN departments ON employees.department_id = departments.department_id;


-- JOIN EMPLOYEES & DEPARTMENTS WITH USING 
SELECT * FROM employees
	JOIN departments USING(department_id)

-- Show department name with average salary
SELECT department_name, ROUND(AVG(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name

-- count employee in each department
SELECT department_name, count(*) FROM employees 
	JOIN departments USING(department_id)
	GROUP BY department_name;

-- FIND THE DEPARTMENT NAME WITH THE HIGHEST AVERAGE SALARY
SELECT department_name, ROUND(AVG(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1


SELECT EXTRACT(YEAR FROM hire_date) as hire_year, count(*) FROM employees
GROUP BY hire_year


-- CREATE ORDERS TABLE
CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	total_amount DECIMAL(10, 2)
)

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
(1, '2022-01-10', 150.50),
(2, '2022-01-12', 200.75),
(2, '2024-01-15', 99.99),
(3, '2021-09-20', 320.00),
(5, '2024-02-05', 250.50),
(5, '2022-02-10', 175.00),
(7, '2024-02-15', 80.25),
(1, '2022-03-01', 420.75),
(1, '2020-05-05', 300.40),
(3, '2019-07-10', 95.60);

DROP TABLE orders


-- Find customers who have placed more than 2 orders and calculate the total amount spent by each of these customers
SELECT customer_id, COUNT(order_id) as order_list, SUM(total_amount) as total_spent FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2


-- Find the total amount of order placed each month in the year 2022
SELECT EXTRACT(MONTH FROM order_date) as month,SUM(total_amount) FROM orders WHERE EXTRACT(year from order_date) = 2022
	GROUP BY month
