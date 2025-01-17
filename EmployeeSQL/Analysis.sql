-- List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no,
		e.last_name,
		e.first_name,
		e.sex,
		s.salary
FROM employees AS e
		JOIN salaries AS s
		ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name,
		last_name,
		hire_date
FROM employees
WHERE hire_date >'1985-12-31' AND hire_date <'1987-1-1'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT d.dept_no,
		d.dept_name,
		dm.emp_no,
		e.last_name,
		e.first_name
FROM departments AS d
INNER JOIN dept_manager AS dm
		ON d.dept_no=dm.dept_no
INNER JOIN employees AS e
		ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 

SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d. dept_name
FROM employees as e
INNER JOIN dept_emp
	ON e.emp_no=dept_emp.emp_no
INNER JOIN departments as d
	ON dept_emp.dept_no=d.dept_no
WHERE dept_name='Sales' OR dept_name ='Development'
ORDER BY emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;