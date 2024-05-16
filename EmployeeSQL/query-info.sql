-- list employee info (#, names, sex, salary)
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY 1;

-- list names, hire date for 1986
SELECT emp_no, first_name, last_name, hire_date 
FROM employees 
WHERE date_part('year', hire_date) = 1986;

--list department managers (#, name, employee #, last-first name)
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM dept_manager AS d_m
INNER JOIN departments AS d
ON d_m.dept_no= d.dept_no
INNER JOIN employees AS e
ON d_m.emp_no = e.emp_no
ORDER BY 1;

--list departmnet # for employees & #, last, first, depart. name
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
ORDER BY 1;


-- list first, last name & sex of employees f.name Hercules and last name 'B'
SELECT e.last_name, e.first_name, e.sex
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%')
ORDER BY e.last_name;

-- listemployees in sales depart. 
-- include employee # l.name f.name
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- list employees in sales and development departs
-- employee #, last, first, depart name
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


-- frequency counts in descending order
SELECT last_name,COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;