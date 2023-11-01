--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no,
       last_name,
       first_name,
       sex,
       ss.salary
  FROM employees emp,
       salaries ss
 WHERE emp.emp_no = ss.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
       last_name,
       hire_date
  FROM employees
 WHERE date_part('year', hire_date) = '1986'
 ORDER BY hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.emp_no,
       dm.dept_no,
       d.dept_name,
       emp.last_name,
       emp.first_name
  FROM employees emp,
       dept_manager dm,
       departments d
 WHERE emp.emp_no = dm.emp_no
   AND dm.dept_no = d.dept_no
 ORDER BY dm.dept_no;

 --List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
 SELECT de.dept_no,
        emp.emp_no,
        emp.last_name,
        emp.first_name,
        d.dept_name
   FROM employees emp,
         dept_emp de,
         departments d
  WHERE emp.emp_no = de.emp_no
    AND de.dept_no = d.dept_no	
  ORDER BY de.dept_no;

 --List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
 SELECT first_name,
        last_name,
        sex
   FROM employees
  WHERE first_name = 'Hercules'
    AND last_name like 'B%'
 ORDER BY sex;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no,
       emp.last_name,
       emp.first_name,
       d.dept_name
  FROM departments d,
       dept_emp de,
       employees emp
 WHERE d.dept_name='Sales'
   AND d.dept_no=de.dept_no
   AND de.emp_no=emp.emp_no
 ORDER BY emp.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,
       emp.last_name,
       emp.first_name,
       d.dept_name
  FROM departments d,
       dept_emp de,
       employees emp
 WHERE d.dept_name in ('Development','Sales')
   AND d.dept_no = de.dept_no
   AND de.emp_no=emp.emp_no
 ORDER BY dept_name;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
       COUNT(1) frequency_counts
  FROM employees
 GROUP BY last_name
 ORDER BY frequency_counts DESC;