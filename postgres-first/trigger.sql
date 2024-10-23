CREATE Table my_users
(
	user_name VARCHAR(50),
	email VARCHAR(100)
)

INSERT INTO my_users VALUES
('mezba', 'mezba@gmail.com'), ('mir', 'mir@gmail.com')


CREATE TABLE deleted_users_audit
(
	deleted_user_name VARCHAR(50),
	deletedAt TIMESTAMP
)

SELECT * FROM  my_users;
SELECT * FROM  deleted_users_audit;

-- trigger function
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
		INSERT INTO deleted_users_audit VALUES(OLD.user_name, now());
		RAISE NOTICE 'Deleted user audit log created!';
		RETURN OLD;
END
$$


CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();


-- delete user
DELETE FROM my_users WHERE user_name = 'mir'