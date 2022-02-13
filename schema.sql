-- SQL Challenge

CREATE TABLE departments(
    dept_no         VARCHAR(4)          NOT NULL,
    dept_name       VARCHAR(40)         NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles(
    title_id        VARCHAR(5)          NOT NULL,
    title           VARCHAR(50)         NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees(
    emp_no          INT                 NOT NULL,
    emp_title_id    VARCHAR(5)          NOT NULL,
    birth_date      DATE                NOT NULL,
    first_name      VARCHAR(20)         NOT NULL,
    last_name       VARCHAR(20)         NOT NULL,
    sex             VARCHAR(1)          NOT NULL,
    hire_date       DATE                NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp(
    emp_no          INT                 NOT NULL,
    dept_no         VARCHAR(4)          NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
    dept_no          VARCHAR(4)          NOT NULL,
	emp_no           INT                 NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries(
    emp_no          INT                 NOT NULL,
    salary          INT                 NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE dept_manager;

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees as e
JOIN salaries as s
ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1/1/1986' AND hire_date < '1/1/1987';

-- 3. List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, dm.dept_name, 
FROM dept_manager as dm


-- 4. List the department of each employee with the following information: employee number,
-- last name, first name, and department name.


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.




