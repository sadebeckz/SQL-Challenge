-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(1) CHECK (gender IN ('M', 'F')),
    hire_date DATE NOT NULL
);

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);
