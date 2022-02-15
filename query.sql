-- #### Data Analysis by Daniel Garza

-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
    e.emp_no "Employee No.",
    e.last_name "Last Name",
    e.first_name "First Name",
	e.sex "Sex",
    s.salary "Salary"
FROM employees e
JOIN salaries s
USING (emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name "First Name",
	last_name "Last Name",
	hire_date "Hire Date"
FROM employees
WHERE hire_date >= '1/1/1986' AND hire_date < '1/1/1987';

-- 3. List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
SELECT
	dm.dept_no "Department Number",
	d.dept_name "Department Name",
	e.emp_no "Managers Emp No",
	e.last_name "Last Name",
	e.first_name "First Name"
FROM departments d
JOIN dept_manager dm
ON (d.dept_no = dm.dept_no)
JOIN employees e
ON (e.emp_no = dm.emp_no);

-- 4. List the department of each employee with the following information: employee number,
-- last name, first name, and department name.
SELECT
	e.emp_no "Employee No.",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM employees e
JOIN dept_emp de
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name "First Name",
	last_name "Last Name",
	sex "Employee Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no "Employee No.",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM employees e
JOIN dept_emp de
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT
	e.emp_no "Employee No.",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM employees e
JOIN dept_emp de
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT(last_name)
FROM employees
GROUP BY last_name;

-- BONUS
-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all,
-- trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started.
-- Be sure to make any necessary modifications for your username, password, host, port, and database name:

