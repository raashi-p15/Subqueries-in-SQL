CREATE DATABASE four_db;

USE four_db;

CREATE TABLE EMP(
emp_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
job_title VARCHAR(50),
dept_id INT,
dept_name VARCHAR(100),
salary INT,
bonus decimal(5,2),
state VARCHAR(50),
constraint pk_emp
  PRIMARY KEY (emp_id)
);

ALTER TABLE EMP
MODIFY COLUMN bonus decimal(6,2);

INSERT INTO EMP (emp_id, first_name, last_name, job_title, dept_id, dept_name, salary, bonus, state) VALUES
(1, 'Harry', 'Potter', 'Sales Manager', 4, 'Sales', 40000, NULL, 'Andhra Pradesh'),
(2, 'Hermoine', 'Granger', 'General Manager', 1, 'Management', 60000, 5000, 'Maharashtra'),
(3, 'Ronald', 'Weasley', 'Operations Analyst', 3, 'Operations', 30000, NULL, 'Haryana'),
(4, 'Ginevra', 'Weasley', 'Software Developer', 2, 'Tech', 70000, 6000, 'Haryana'),
(5, 'Draco', 'Malfoy', 'Marketing Analyst', 5, 'Marketing', 50000, NULL, 'Kerala'),
(6, 'George', 'Weasley', 'Cloud Engineer', 2, 'Tech', 65000, 5000, 'Haryana'),
(7, 'Albus', 'Dumbledore', 'CEO', 1, 'Management', 120000, 8000, 'Maharashtra'),
(8, 'Severus', 'Snape', 'Product Manager', 3, 'Operations', 70000, 6000, 'Manipur'),
(9, 'Rita', 'Skeeter', 'Sales Analyst', 4, 'Sales', 60000, 7000, 'Rajasthan'),
(10, 'Luna', 'Lovegood', 'CFO', 6, 'Finance', 100000, 7000, 'Punjab');

CREATE TABLE DEPT (
dept_id INT,
dept_name VARCHAR(100),
location VARCHAR(100),
manager_no INT,
constraint pk_dept
   PRIMARY KEY (dept_id)
);

INSERT INTO DEPT (dept_id, dept_name, location, manager_no) VALUES
(1, 'Management', 'Maharashtra', 4),
(2, 'Tech', 'Haryana', 3),
(3, 'Operations', 'Manipur', 5),
(4, 'Sales', 'Rajasthan', 6),
(5, 'Marketing', 'Kerala', 2),
(6, 'Finance', 'Punjab', 1);

ALTER TABLE EMP
ADD constraint fk_stud_dept FOREIGN KEY (dept_id) references DEPT (dept_id);

ALTER TABLE EMP 
MODIFY COLUMN job_title VARCHAR(100) NOT NULL;

ALTER TABLE EMP 
MODIFY COLUMN dept_name VARCHAR(100) NOT NULL;

ALTER TABLE EMP
MODIFY COLUMN dept_id INT default 1;

ALTER TABLE DEPT
ADD UNIQUE(manager_no);

SELECT * FROM EMP;

SELECT * FROM DEPT;

INSERT INTO EMP(emp_id, first_name, last_name, job_title, dept_id, dept_name, salary, bonus, state) VALUES
(11, 'Mafalda', 'Hopkirk', 'Software Developer', 2, 'Tech', 60000, 7000, 'Rajasthan'),
(12, 'Lucius', 'Malfoy', 'Product Manager', 1, 'Management', 40000, 8000, 'Punjab'),
(13, 'Bellatrix', 'Lestrange', 'Marketing Analyst', 5, 'Marketing', 70000, 3000, 'Manipur');
