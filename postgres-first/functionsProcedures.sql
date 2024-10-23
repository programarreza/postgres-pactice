CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
	SELECT COUNT(*) FROM employees
$$

SELECT emp_count()

CREATE FUNCTION delete_employees()
RETURNS void
LANGUAGE SQL
AS
$$
	DELETE FROM employees
		WHERE employee_id = 30
$$

SELECT delete_employees()




CREATE FUNCTION delete_emp_by_id(p_emp_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
	DELETE FROM employees 
		WHERE employee_id = p_emp_id

$$

SELECT delete_emp_by_id(29)


CREATE PROCEDURE remove_emp()
LANGUAGE plpgsql
AS
$$
	BEGIN 
		DELETE FROM employees WHERE employee_id = 28;
	END
$$;

CALL remove_emp()


CREATE PROCEDURE remove_emp_var3()
LANGUAGE plpgsql
AS
$$
	DECLARE 
	test_var INT;
	BEGIN
		SELECT employee_id INTO test_var FROM employees 
			WHERE employee_id = 31;

		DELETE FROM employees WHERE employee_id = test_var;
	END
$$

CALL remove_emp_var3()


CREATE PROCEDURE remove_emp_by_id(p_emp_id INT)
LANGUAGE plpgsql
AS
$$
	DECLARE 
	test_var INT;
	BEGIN
		SELECT employee_id INTO test_var FROM employees 
			WHERE employee_id = p_emp_id;

		DELETE FROM employees WHERE employee_id = test_var;
	END
$$

CALL remove_emp_by_id(34)


SELECT * FROM employees