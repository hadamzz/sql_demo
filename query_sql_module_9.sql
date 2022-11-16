DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

drop table if exists dept_emp;

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

--     CONSTRAINT pk_dept_emp PRIMARY KEY (
--         emp_no
--      )

select * from dept_emp;

--

drop table if exists dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL
);

-- ,
--     CONSTRAINT pk_dept_manager PRIMARY KEY (
--         dept_no
--      )

--

drop table if exists employees;

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NULL,
    last_name VARCHAR   NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL
);

-- ,
--     CONSTRAINT pk_employees PRIMARY KEY (
--         emp_no
--      )

--

drop table if exists salaries;

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

-- ,
--     CONSTRAINT pk_salaries PRIMARY KEY (
--         emp_no
--      )

--

drop table if exists titles; 

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL
);

-- ,
--     CONSTRAINT pk_titles PRIMARY KEY (
--         title_id
--      )

--

-- ALTER TABLE departments ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
-- REFERENCES dept_manager (dept_no);

-- --
-- ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
-- REFERENCES dept_emp (dept_no);
-- --

-- ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
-- REFERENCES employees (emp_no);

-- ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
-- REFERENCES dept_emp (emp_no);

-- ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
-- REFERENCES employees (emp_no);

-- --
-- ALTER TABLE titles ADD CONSTRAINT fk_titles_title FOREIGN KEY(title)
-- REFERENCES employees (emp_title);
-- --

CREATE INDEX idx_dept_manager_emp_no
ON dept_manager (emp_no);

CREATE INDEX idx_employees_emp_title
ON employees (emp_title);

-- DATA ANALYSIS --
--1.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
--2.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;
--3.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--4.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
--5.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name Like 'B%'
--6.
SELECT departments.dept_name, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
--7.
SELECT departments.dept_name, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';
--8.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;