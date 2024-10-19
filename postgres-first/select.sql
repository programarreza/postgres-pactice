-- create student table
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT,
	grade CHAR(2),
	course VARCHAR(50),
	email VARCHAR(100),
	dob DATE,
	blood_group VARCHAR(5),
	country VARCHAR(50)
)

-- data alias
SELECT email as "Student Email", age, country FROM students

-- sort by ascending 
SELECT * FROM students ORDER BY first_name ASC   

-- sort by descending
SELECT country FROM students ORDER BY country ASC

-- find unique 
SELECT DISTINCT blood_group FROM students


-- data filtering
-- Q-1. Select students from the USA
-- Q-2. Select students with 'A' grade in Physics
-- Q-3. Select students with a specific blood group ('A+')
-- Q-4. Select students from the USA or from UK
-- Q-5. Select students from the USA or from UK and age is 20 
-- Q-6. Select students with a grade of 'A' or 'B' in Math or Physics
-- Q-7. Select students older than 20

-- A-1
-- SELECT * FROM students
-- 	WHERE country = 'USA'

-- A-2
-- SELECT * FROM students
-- 	WHERE grade = 'A' AND course = 'Physics'

-- A-3
-- SELECT * FROM students
-- 	WHERE blood_group =  'A+'

-- A-4
-- SELECT * FROM students
-- 	WHERE country = 'USA' OR country = 'UK'


-- A-5 
-- SELECT * FROM students
-- 	WHERE (country = 'USA' OR country = 'UK') AND age = 20

-- A-6
-- SELECT * FROM students
-- 	WHERE (grade = 'A' OR grade = 'B') AND (course = 'Math' OR course =  'Physics')

-- A-7
-- SELECT * FROM students
-- 	WHERE age > 20 
-- SELECT * FROM students
-- 	WHERE age >= 20 
-- SELECT * FROM students
-- 	WHERE age <= 20 
-- SELECT * FROM students
-- 	WHERE age != 20 
-- SELECT * FROM students
-- 	WHERE age <> 20 

-- select upper case
-- SELECT UPPER(first_name),  * FROM students

-- select concat 
-- SELECT concat(first_name,' ', last_name) FROM students

-- select length
-- SELECT LENGTH(first_name) FROM students

-- SELECT AVG(age) FROM students
-- SELECT MAX(age) FROM students
-- SELECT MIN(age) FROM students
-- SELECT COUNT(*) FROM students
-- SELECT MAX(LENGTH(first_name)) FROM students

SELECT * FROM students
WHERE NOT country = 'USA'

SELECT * FROM students
	WHERE email IS NULL

SELECT * FROM students
	WHERE email IS NOT NULL

-- null value in set default value
SELECT COALESCE(email, 'email not provided')as "Email", first_name, age FROM students;


SELECT * FROM students
	WHERE country = 'USA' OR country = 'UK' OR country = 'Canada'

SELECT * FROM students WHERE country IN('USA', 'UK', 'Canada')
SELECT * FROM students WHERE country NOT IN('USA', 'UK', 'Canada')

SELECT * FROM students
	WHERE age BETWEEN 19 and 20

SELECT * FROM students
	WHERE dob BETWEEN '2000-01-01' AND '2003-01-01' ORDER BY dob

-- first_name ar last disid jodi a hoy tahole sei data dibe
SELECT * FROM students
	WHERE first_name LIKE '%a';

-- first_name ar first disid jodi a hoy tahole sei data dibe
SELECT * FROM students
	WHERE first_name LIKE 'A%';

SELECT * FROM students
	WHERE first_name LIKE

SELECT * FROM students
	WHERE first_name LIKE '__a'

SELECT * FROM students
	WHERE first_name ILIKE 'a%'


SELECT * FROM students ORDER BY student_id LIMIT 5 OFFSET 5

SELECT * FROM students 
	WHERE country NOT IN('USA', 'UK', 'Canada') LIMIT 5

SELECT * FROM students ORDER BY student_id
	LIMIT 5 OFFSET 5 * 0;

SELECT * FROM students ORDER BY student_id
	LIMIT 5 OFFSET 5 * 1;

SELECT * FROM students ORDER BY student_id
	LIMIT 5 OFFSET 5 * 2;

SELECT * FROM students ORDER BY student_id
	LIMIT 5 OFFSET 5 * 3

SELECT * FROM students

DELETE FROM students
	WHERE grade = 'A' AND country = 'USA'

-- update email field 
UPDATE students
	SET email = 'default@gmail.com' , age = 30
	WHERE student_id = 3