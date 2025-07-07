USE four_db;

-- subquery in SELECT clause

/* fetch all details of employees and add a remark in those employees who earn more than the average pay */

SELECT *
 ,(case when SALARY> (SELECT avg(salary) FROM emp) 
        then 'Higher than average'
        else null
   end )AS remark
FROM emp;

-- subquery in FROM clause

SELECT emp_id, first_name, last_name, job_title
FROM emp e
JOIN (SELECT avg(salary) sal FROM emp) avg_sal
     ON e.salary > avg_sal.sal;
     
SELECT *
 ,(case when SALARY> avg_sal.sal
        then 'Higher than average'
        else null
   end )AS remark
FROM emp
CROSS JOIN (SELECT avg(salary) sal FROM emp) AS avg_sal; -- subquery in SELECT and FROM clauses
     
-- subquery in WHERE clause

SELECT emp_id
FROM emp
WHERE salary> (
 SELECT AVG(salary) FROM emp);
 
SELECT emp_id, first_name, last_name, job_title
FROM emp
WHERE bonus IN (
 SELECT MAX(bonus) FROM emp);
 
SELECT dept_id, dept_name, location
FROM dept
WHERE manager_no = (
 SELECT COUNT(*) FROM dept);
 
SELECT * 
FROM emp 
WHERE (dept_name, salary) IN 
							(SELECT dept_name, max(salary) 
                            FROM emp 
                            WHERE dept_id <> 3
                            GROUP BY dept_name
                            );

SELECT * FROM emp
WHERE EXISTS (SELECT bonus FROM emp);

-- correlated subquery
SELECT *
FROM emp e1
WHERE ( SELECT AVG(salary) 
        FROM emp e2
        WHERE e2.dept_name = e1.dept_name);
        
SELECT *
FROM dept d
WHERE not exists (SELECT*
				  FROM emp e
				  WHERE e.dept_name = d.dept_name); -- correlated
SELECT *
FROM dept
WHERE dept_id NOT IN (SELECT dept_id
                      FROM emp); -- simple



