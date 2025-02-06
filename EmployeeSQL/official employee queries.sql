-- List all employees with their salary
SELECT emp_no, last_name, first_name, gender, salary 
FROM employees
JOIN salaries USING(emp_no);

-- List employees hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List department managers
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

-- List employees with their department details
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- Find employees whose first name is 'Hercules' and last name starts with 'B'
SELECT first_name, last_name, gender 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department
SELECT e.emp_no, e.last_name, e.first_name 
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List employees in Sales & Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Count employees with the same last name
SELECT last_name, COUNT(*) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;
