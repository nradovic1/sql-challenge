--Import EDR from QuickDBD to create tables with relations
CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_employees (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

CREATE TABLE Dept_managers (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Dept_employees ADD CONSTRAINT fk_Dept_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employees ADD CONSTRAINT fk_Dept_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_managers ADD CONSTRAINT fk_Dept_managers_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_managers ADD CONSTRAINT fk_Dept_managers_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


-------------------------------------------------------------------------------
--Import data from csv files

SELECT *
FROM employees
--1-----------------------------------------------------------------------------
SELECT s.emp_no,
 	   e.first_name,
	   e.last_name,
	   e.sex,
	   s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
--2-----------------------------------------------------------------------------
SELECT first_name,
	   last_name,
	   hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'
--3-----------------------------------------------------------------------------
SELECT d.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.first_name,
	   e.last_name
FROM departments d
JOIN dept_managers dm
ON d.dept_no=dm.dept_no
JOIN employees e
ON dm.emp_no=e.emp_no
--4------------------------------------------------------------------------------
SELECT de.emp_no,
	   e.first_name,
	   e.last_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
--5-------------------------------------------------------------------------------
SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
--6-------------------------------------------------------------------------------
SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales'
--7-------------------------------------------------------------------------------
SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
--8-------------------------------------------------------------------------------
SELECT last_name, 
	   COUNT(last_name) AS "Total Last Names"
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC

	   
	   
	   
	   

