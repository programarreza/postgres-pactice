-- Active: 1729142840375@@127.0.0.1@5432@ph

-- get all data
SELECT * FROM person2;

-- add column into table
ALTER TABLE person2 
	ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;

-- delete column into table
ALTER TABLE person2 DROP COLUMN email

-- set data into table
INSERT INTO person2 VALUES(8, 'md reza', 23, 'reza@gmail.com')


-- rename column 
ALTER TABLE person2 
	RENAME COLUMN age to user_age;


-- table column type change
ALTER TABLE person2
	ALTER COLUMN user_name TYPE VARCHAR(50)

-- table column constant set notNull
ALTER TABLE person2 
	ALTER COLUMN user_age set NOT NULL -- DEFAULT/UNIQUE

-- table column remove constant 
ALTER TABLE person2
	ALTER COLUMN user_age DROP NOT NULL;

-- add unique type
ALTER TABLE person2
	ADD constraint unique_person2_user_age UNIQUE(user_age);

-- drop unique type
ALTER TABLE person2
	DROP constraint unique_person2_user_age; 

-- drop only tappol/role not drop column and structure
TRUNCATE TABLE person2

-- drop full table 
DROP TABLE person2