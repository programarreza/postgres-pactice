SELECT * from students

SELECT country, count(*), AVG(age) FROM students
	GROUP BY country

-- Filter Groups Using HAVING to show only countries with average age above 20.50
SELECT country , AVG(age) FROM students
	GROUP BY country
		HAVING AVG(age) > 20.5


-- Count students born in each year
SELECT EXTRACT(YEAR FROM dob) as birth_yearn , count(*)
	FROM students
	GROUP BY birth_yearn



CREATE TABLE "user"(
	id SERIAL PRIMARY KEY,
	username VARCHAR(25)
)


-- ALTER TABLE "user" 
-- ALTER COLUMN SET username TYPE NOT NULL;

SELECT * FROM "user"
	WHERE username IS NOT NULL

SELECT * FROM "user"

-- create user table
CREATE TABLE "user"(
	id SERIAL PRIMARY KEY,
	username VARCHAR(25) NOT NULL
)

-- create post table with ON DELETE CASCADE
-- CREATE TABLE post(
-- 	id SERIAL PRIMARY KEY,
-- 	title TEXT NOT NULL,
-- 	user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
-- )

-- create post table with ON DELETE SET NULL
-- CREATE TABLE post(
-- 	id SERIAL PRIMARY KEY,
-- 	title TEXT NOT NULL,
-- 	user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL
-- )

-- create post table with ON DELETE SET DEFAULT
-- CREATE TABLE post(
-- 	id SERIAL PRIMARY KEY,
-- 	title TEXT NOT NULL,
-- 	user_id INTEGER REFERENCES "user"(id) on delete set DEFAULT DEFAULT 2
-- )

-- create post table
CREATE TABLE post(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	user_id INTEGER REFERENCES "user"(id) 
)

-- insert user data
INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi')

-- insert post data
INSERT INTO post (title, user_id) VALUES
	('Enjoying a sunny day with Akash!', 2),
	('Batash just shared an amazing recipe!', 1),
	('Exploring adventures with Sagor', 4),
	('Nodi''s wisdom always leaves me inspired', 4)

ALTER TABLE post
    ALTER COLUMN user_id SET NOT NULL;

INSERT INTO post (title, user_id) VALUES('test2', NULL)

-- DROP TABLE post;
-- DROP TABLE "user";


-- delete user and this post 
DELETE FROM "user"
    WHERE id = 4

SELECT * FROM post;
SELECT * FROM "user";


