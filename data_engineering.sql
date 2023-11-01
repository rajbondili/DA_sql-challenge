--Drop database if already exists
DROP DATABASE IF EXISTS sql_challenge_db;

CREATE DATABASE sql_challenge_db
     WITH
	 OWNER=postgres
	 ENCODING='UTF-8'
	 LC_COLLATE = 'English_Australia.1252'
	 LC_CTYPE = 'English_Australia.1252'
	 TABLESPACE = pg_default
     CONNECTION_LIMIT = -1
	 IS_TEMPLATE = False;
	 
ALTER ROLE postgres IN DATABASE sql_challenge_db
      SET "DateStyle" TO 'MDY';
----------------------------------------------------------------	 
--Drop tables if already exists in the schema
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
--------------------------------------------------------
--creating table departments:
CREATE TABLE departments(dept_no VARCHAR(10) PRIMARY KEY,
                         dept_name VARCHAR(20) NOT NULL);

--checking the data from departments:
SELECT * FROM departments;

--------------------------------------------------------------------------
--creating table titles:
CREATE TABLE titles(title_id VARCHAR(10) PRIMARY KEY,
                    title_name VARCHAR(20) NOT NULL);

--checking the data from titles:
SELECT * FROM titles;

--------------------------------------------------------------------------------------------------
--creating table employees:
CREATE TABLE employees(emp_no         INT PRIMARY KEY,
                       emp_title_id   VARCHAR(10) NOT NULL,
                       birth_date     DATE,
                       first_name     VARCHAR(20) NOT NULL,
                       last_name      VARCHAR(20) NOT NULL,
                       sex            VARCHAR(1),
                       hire_date      DATE,
                       FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
    

--checking the data from employees:
SELECT * FROM employees;
-----------------------------------------------------------------------------------------------------
--creating table dept_emp:
CREATE TABLE dept_emp(emp_no INT NOT NULL,
                      dept_no  VARCHAR(10) NOT NULL,
                      FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
                      FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

--checking the data from dept_emp:
SELECT * FROM dept_emp;
-----------------------------------------------------------------------------------------------------
--creating table dept_manager:
CREATE TABLE dept_manager(dept_no  VARCHAR(10) NOT NULL,
						  emp_no INT NOT NULL,
                          FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
                          FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

--checking the data from dept_manager:
SELECT * FROM dept_manager;

---------------------------------------------------------------------------------------------
--creating table salaries:
CREATE TABLE salaries(emp_no INT NOT NULL,
                      salary INT NOT NULL,
                      FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--checking the data from salaries:
SELECT * FROM salaries;
--------------------------------------------------------------------------------------------------------------
