DECLARE
	numer_max NUMBER;

BEGIN
	SELECT d.DEPARTMENT_ID 
	INTO numer_max
	FROM DEPARTMENTS d 
	ORDER BY d.DEPARTMENT_ID DESC
	FETCH NEXT 1 ROWS ONLY;
	
	DBMS_OUTPUT.put_line(numer_max);

	INSERT INTO DEPARTMENTS 
	(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) 
	VALUES (numer_max + 10, 'EDUCATION', NULL, null);
END;



DECLARE
	numer_max NUMBER;
	location_id NUMBER := 3000;

BEGIN
	SELECT d.DEPARTMENT_ID 
	INTO numer_max
	FROM DEPARTMENTS d 
	ORDER BY d.	DEPARTMENT_ID DESC
	FETCH NEXT 1 ROWS ONLY;
	
	DBMS_OUTPUT.put_line(numer_max);



	INSERT INTO DEPARTMENTS 
	(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) 
	VALUES (numer_max + 10, 'EDUCATION', NULL, location_id);
END;


BEGIN
  FOR num IN 1..10 LOOP
    IF num = 4 THEN
      DBMS_OUTPUT.PUT_LINE(num);
    ELSIF num = 6 THEN
      DBMS_OUTPUT.PUT_LINE(num);
    ELSE
      INSERT INTO my_table (my_field) VALUES (num);
    END IF;
  END LOOP;
END;




DECLARE
	country_row COUNTRIES%ROWTYPE;
BEGIN
SELECT * INTO country_row FROM COUNTRIES c WHERE COUNTRY_ID = 'CA';

DBMS_OUTPUT.put_line(country_row.COUNTRY_NAME);
DBMS_OUTPUT.put_line(country_row.REGION_ID);

END;

DECLARE
	step PLS_INTEGER := 10;

	TYPE table_departments IS TABLE OF departments.DEPARTMENT_NAME%TYPE INDEX BY PLS_INTEGER;
	department table_departments;
BEGIN
	FOR i IN 1..10
	LOOP	
		SELECT d.DEPARTMENT_NAME INTO department(i) FROM DEPARTMENTS d WHERE d.DEPARTMENT_ID = i*step;
	END LOOP;

	FOR i IN department.FIRST..department.LAST
	LOOP
		DBMS_OUTPUT.put_line(department(i));
	END LOOP;
END;

DECLARE
	step PLS_INTEGER := 10;

	TYPE table_departments IS TABLE OF departments%ROWTYPE INDEX BY PLS_INTEGER;
	department table_departments;
BEGIN
	FOR i IN 1..10
	LOOP	
		SELECT * INTO department(i) FROM DEPARTMENTS d WHERE d.DEPARTMENT_ID = i*step;
	END LOOP;

	FOR i IN department.FIRST..department.LAST
	LOOP
		DBMS_OUTPUT.put_line(department(i).DEPARTMENT_ID || ' ' || department(i).DEPARTMENT_NAME || ' ' || department(i).MANAGER_ID || ' ' || department(i).LOCATION_ID);
	END LOOP;
END;

DECLARE
	CURSOR employee_50 IS
	SELECT e.SALARY, e.LAST_NAME FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = 50;
BEGIN
	FOR employee IN employee_50
	LOOP
		IF employee.SALARY > 3100 THEN
			DBMS_OUTPUT.put_line(employee.LAST_NAME || ' nie dawać podwyżki');
		ELSE
			DBMS_OUTPUT.put_line(employee.LAST_NAME || ' dać podwyżkę');
		END IF;
	END LOOP;		
END;

DECLARE
	CURSOR employee_1000_5000_A IS
	SELECT * FROM EMPLOYEES e WHERE e.SALARY BETWEEN 1000 AND 5000 AND upper(e.FIRST_NAME) LIKE '%A%';

	CURSOR employee_5000_20000_U IS
	SELECT * FROM EMPLOYEES e WHERE e.SALARY BETWEEN 5000 AND 20000 AND upper(e.FIRST_NAME) LIKE '%U%';
BEGIN
	FOR employee_table IN employee_1000_5000_A
	LOOP
		DBMS_OUTPUT.put_line(employee_table.SALARY || ' ' || employee_table.FIRST_NAME|| ' ' || employee_table.LAST_NAME);
	END LOOP;

	FOR employee_table IN employee_5000_20000_U
	LOOP
		DBMS_OUTPUT.put_line(employee_table.SALARY || ' ' || employee_table.FIRST_NAME|| ' ' || employee_table.LAST_NAME);
	END LOOP;		
END;




CREATE OR REPLACE PROCEDURE AddJob (
    Job_ids IN Jobs.Job_id%TYPE,
    Job_titles IN Jobs.Job_title%TYPE
) AS
BEGIN
    INSERT INTO Jobs (Job_id, Job_title) VALUES (Job_ids, Job_titles);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wyjątek');
END;

BEGIN
	AddJob('MyId', 'MyTitle');
END;

CREATE OR REPLACE PROCEDURE UpdateJobTitle(
    Job_ids IN Jobs.Job_id%TYPE,
    New_Job_title IN Jobs.Job_title%TYPE
) AS
    NumberOfRows NUMBER;
BEGIN
    UPDATE Jobs SET Job_title = New_Job_title WHERE Job_id = Job_ids;
    NumberOfRows := SQL%ROWCOUNT;
    
    IF NumberOfRows = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No rows updated in Jobs');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wyjątek');
END;

CALL UpdateJobTitle('MyId', 'NewTitle');


CREATE OR REPLACE PROCEDURE DeleteJobs(
    p_Job_id IN Jobs.Job_id%TYPE
) AS
    v_NumRows NUMBER;
BEGIN
    DELETE FROM Jobs WHERE Job_id = p_Job_id;
    v_NumRows := SQL%ROWCOUNT;
    
    IF v_NumRows = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No rows deleted from Jobs');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wyjątek');
END DeleteJobs;

CALL DeleteJobs('MyId');


CREATE OR REPLACE PROCEDURE GetSalaryAndLastName(
    p_Employee_id IN Employees.Employee_id%TYPE
) AS
    p_Zarobki NUMBER;
    p_Nazwisko VARCHAR(50);
BEGIN
    SELECT Salary, Last_name INTO p_Zarobki, p_Nazwisko FROM Employees WHERE Employee_id = p_Employee_id;    
    DBMS_OUTPUT.PUT_LINE('Zarobki pracownika o ID ' || p_Employee_id || ': ' || p_Zarobki);
    DBMS_OUTPUT.PUT_LINE('Nazwisko pracownika o ID ' || p_Employee_id || ': ' || p_Nazwisko);
END;

CALL GetSalaryAndLastName('100')


CREATE OR REPLACE PROCEDURE add_employee (
    p_first_name IN EMPLOYEES.FIRST_NAME%TYPE,
    p_last_name IN EMPLOYEES.LAST_NAME%TYPE,
    p_email IN EMPLOYEES.EMAIL%TYPE DEFAULT 'email@email.com',
    p_phone_number IN EMPLOYEES.PHONE_NUMBER%TYPE DEFAULT '997',
    p_job_id IN EMPLOYEES.JOB_ID%TYPE DEFAULT 'AD_PRES',
    p_salary IN EMPLOYEES.SALARY%TYPE DEFAULT 10000,
    p_commission_pct IN EMPLOYEES.COMMISSION_PCT%TYPE DEFAULT NULL,
    p_manager_id IN EMPLOYEES.MANAGER_ID%TYPE DEFAULT 100,
    p_department_id IN EMPLOYEES.DEPARTMENT_ID%TYPE DEFAULT 90
) AS
    V_EMPLOYEE_ID NUMBER;
BEGIN
    IF p_salary > 20000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Wynagrodzenie ponad 20000');
    ELSE
        SELECT (MAX(employee_id) + 1) INTO V_EMPLOYEE_ID FROM EMPLOYEES;
         
        INSERT INTO EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
        VALUES (V_EMPLOYEE_ID, p_first_name, p_last_name, p_email, p_phone_number, SYSDATE, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id);
    END IF;
END;
/


CALL add_employee(p_first_name => 'Jan', p_last_name => 'Kowalski');