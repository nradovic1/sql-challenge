-------------------------------------------------------------------------------
--Import data from csv files using the right click command in the schemas

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

	   
	   
	   
	   

