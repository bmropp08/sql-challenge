CREATE TABLE departments(
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(40)
);

CREATE TABLE titles(
    title_id VARCHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(40)
);
CREATE TABLE employees(
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    sex VARCHAR(1),
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE department_employee(
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE department_manager(
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (salary, emp_no)
);