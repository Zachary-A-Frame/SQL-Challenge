-- Creating Table for Employees.csv

-- CREATE TABLE Employees (
-- 	emp_no INT NOT NULL PRIMARY KEY,
-- 	emp_title_id VARCHAR(20),
-- 	birth_date DATE NOT NULL,
-- 	first_name VARCHAR(20),
-- 	last_name VARCHAR(20),
-- 	sex varchar(1) NOT NULL,
-- 	hire_date DATE NOT NULL
-- );

-- -- Creating Table for Departments

-- CREATE TABLE Departments (
-- 	dept_no VARCHAR(10),
-- 	dept_name VARCHAR(30),
-- 		PRIMARY KEY (dept_no)
-- );

-- -- Creating Table for Department Employees 

-- CREATE  TABLE Department_Employees (
-- 	emp_no INT NOT NULL,
-- 	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
-- 	dept_no VARCHAR(5),
-- 	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
-- );

-- -- Creating Table for Dept Managers

-- CREATE TABLE Department_Manager (
--     dept_no VARCHAR   NOT NULL,
--     emp_no int   NOT NULL,
-- 	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
-- 	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
-- );

-- -- Creating Table for Salaries.csv

-- CREATE TABLE Salaries (
-- 	emp_no INT NOT NULL,
-- 	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
-- 	salary INT NOT NULL
-- );

-- -- Creating Table for Titles

-- CREATE TABLE Titles (
-- 	title_id VARCHAR(10),
-- 	title VARCHAR(30)
-- );

SELECT * FROM Employees;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON 
Employees.emp_no = Salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM Employees
WHERE hire_date >= '1985-12-31' AND Employees.hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT Department_Manager.emp_no, Department_Manager.dept_no, Departments.dept_no,  Departments.dept_name, Employees.last_name, Employees.first_name 
FROM ((Department_Manager
	  INNER JOIN Departments ON Department_Manager.dept_no = Departments.dept_no)
	  INNER JOIN Employees ON Department_Manager.emp_no = Employees.emp_no);
	  
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name 
FROM ((Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no)
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM ((Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no)
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no)
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM ((Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no)
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) DESC











