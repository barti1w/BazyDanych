CREATE TABLE jobs (
job_id INT NOT NULL PRIMARY KEY,
job_title varchar2(50), 
min_salary DECIMAL(10,2), 
max_salary DECIMAL(10,2)
);

CREATE TABLE employees (
employee_id INT NOT NULL PRIMARY KEY, 
first_name varchar2(50),
last_name varchar2(50),
email varchar2(50),
phone_number varchar2(50),
hire_date DATE,
job_id INT REFERENCES JOBS(job_id),
salary INT,
commission_pct varchar2(50),
manager_id INT,
department_id INT
);

CREATE TABLE job_history (
employee_id INT NOT NULL, 
start_date DATE NOT NULL,
end_date DATE,
job_id INT  REFERENCES JOBS(job_id),
department_id INT  REFERENCES DEPARTMENTS(department_id),
CONSTRAINT job_history_pk PRIMARY KEY (employee_id, start_date)
);

CREATE TABLE departments (
department_id INT NOT NULL PRIMARY KEY, 
department_name varchar2(50),
manager_id INT,
location_id INT  REFERENCES locations(location_id)
);

CREATE TABLE locations (
location_id INT NOT NULL PRIMARY KEY, 
street_address varchar2(50),
postal_code varchar2(50),
city varchar2(50),
state_province varchar2(50),
country_id INT REFERENCES countries(country_id)
);

CREATE TABLE countries (
country_id INT NOT NULL PRIMARY KEY,
country_name varchar2(50),
region_id INT REFERENCES regions(region_id)
);

CREATE TABLE regions (
region_id INT NOT NULL PRIMARY KEY, 
region_name varchar2(50)
);

ALTER TABLE DEPARTMENTS
ADD FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id)

ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id)

ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)