-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
JOIN salaries s
USING (emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT  
    first_name,
    last_name
    hire_date
FROM employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT  
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    department_manager.dept_no,
    departments.dept_name
FROM employees
INNER JOIN department_manager ON
employees.emp_no = department_manager.emp_no
INNER JOIN departments ON
department_manager.dept_no = departments.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT  
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    department_employee.dept_no,
    departments.dept_name
FROM employees
INNER JOIN department_employee ON
employees.emp_no = department_employee.emp_no
INNER JOIN departments ON
department_employee.dept_no = departments.dept_no; 


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    employees.sex,
    employees.last_name,
    employees.first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    emp_no,
    first_name,
    last_name
FROM employees
WHERE emp_no IN
(
    SELECT emp_no
    FROM department_employee
	WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
    )
);


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    employees.emp_no,
    employees.first_name,
    employees.last_name,
	departments.dept_name
FROM employees
INNER JOIN department_employee ON
employees.emp_no = department_employee.emp_no
INNER JOIN departments ON
department_employee.dept_no = departments.dept_no
WHERE department_employee.dept_no IN
	(
      	SELECT dept_no
      	FROM departments
     	WHERE dept_name = 'Sales'
       	OR dept_name = 'Development'
    	
	);

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;