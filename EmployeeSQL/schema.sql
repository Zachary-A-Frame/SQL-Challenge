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


-- Creating Table for Salaries.csv

-- CREATE TABLE Salaries (
-- 	emp_id INT NOT NULL,
-- 	FOREIGN KEY (emp_id) REFERENCES Employees(emp_no),
-- 	salary INT NOT NULL
-- );

-- Creating Table for Department Employees 

CREATE  TABLE Dept_emp (
	emp_id INT NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES Employees(emp_no),
	dept_no VARCHAR(5) PRIMARY KEY,
)

-- Creating Table for Dept. Managers

CREATE TABLE Dept_manager (
	dept_number VARCHAR(5),
	FOREIGN KEY (dept_number) REFERENCES Dept_emp(dept_no),
	emp_id INT NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES Employees(emp_no)
)

-- Creating Table for Titles

CREATE TABLE Titles (
	title_id VARCHAR(5),
	title VARCHAR(30)
)

-- Creating Table for Departments

CREATE TABLE Departments (
	dept_number VARCHAR(5),
	FOREIGN KEY (dept_number) REFERENCES Dept_emp(dept_no),
	dept_name VARCHAR(30)
)


SELECT * FROM Salaries;




