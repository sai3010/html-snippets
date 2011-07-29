create database assignment
use assignment
CREATE TABLE emp  (empno int PRIMARY KEY ,  ename varchar(20) NOT NULL,  job varchar(20),  mgrid int,  doj datetime,  sal decimal(9,2),  comm decimal(9,2),  deptno int);
insert into emp values(17934,'MILLER','CLERK',17782,'01/23/2002',1430,NULL,10);
insert into emp values(17369,'SMITH','CLERK',17902,'12/11/1999',800,NULL,20);
insert into emp values(17499,'ALLEN','SALESMAN',17698,'02/20/2001',1600,300,30);
insert into emp values(17521,'WARD','SALESMAN',17698,'02/22/2001',1250,500,30);
insert into emp values(17566,'JONES','MANAGER',17839,'04/21/2001',2975,NULL,20);
insert into emp values(17654,'MARTIN','SALESMAN',17698,'02/02/2002', 1250,1400,30);
insert into emp values(17782,'CLARK', 'MANAGER',17839,'05/01/2001',2850,NULL,30);
insert into emp values(17788,'SCOTT','ANALYST',17839,'06/09/2001',3000,NULL,20);
insert into emp values(17839,'KING','PRESIDENT',NULL,'11/19/2001',5000,NULL,10);
insert into emp values(17844,'TURNER','SALESMAN',17698,'09/08/2001',1500,0,30);
insert into emp values(17876,'ADAMS', 'CLERK',17788,'01/12/2003',1100,NULL,20);
insert into emp values(17900,'JAMES','CLERK',17900,'12/03/2001',950,NULL,30);
insert into emp values(17902,'FORD','ANALYST',17902,'12/04/2001',3000,NULL,20);
insert into emp values(17698,'BLAKE','MANAGER',17839,'12/04/2001',2450,NULL,20);

CREATE TABLE dept

(deptno int   PRIMARY KEY ,

 dname  varchar(20) NOT NULL,

 loc varchar(20));
INSERT INTO dept VALUES(10,'ACCOUNTS','DELHI');

INSERT INTO dept VALUES(20,'SALES','BOSTON');

INSERT INTO dept VALUES(30,'ADMIN','DALLAS');

INSERT INTO dept VALUES(40,'RESEARCH','KOLKATA');

--1. List the names of analysts and salesmen.
select ename from emp where job = 'analysts' or job = 'salesman';
--Note if you use and instead of or you won't get any answer, since a person can one job so be careful.

--2.List details of employees who have joined before 30 Sep 81.
select empno, ename, job, mgrid, doj, sal, comm, deptno from emp where doj < '30/09/1981';

--3. List names of employees who are not managers.
select ename from emp where job != 'manager';

--4. List the names of employees whose employee numbers are 17369, 17521, 17839, 17934,17788.
select ename from emp where empno in (17369, 17521, 17839, 17934, 17788 );

--5. List employees not belonging to department 30, 40, or 10
select ename from emp where deptno not in (10, 30, 40);

--6. List employee names for those who have joined between 30 June and 31 Dec. ‘2001.
select ename from emp where doj between '06/30/2001' and '12/31/2001' ;

--Here I Have used date range between 2001, but original question it is 1981.
--7.7. List the different designations in the company.
select distinct dname from dept;

--8. List the names of employees who are not eligible for commission.
select ename from emp where comm is null;

--9. List the name and designation of the employee who does not report to anybody.
select ename from emp where mgrid is null;

--10. List the employees not assigned to any department.
select ename from emp where deptno is null;

--11. List the employees who are eligible for commission.
select ename from emp where comm is not null;

--12. List employees whose names either start or end with “S”.
select ename from emp where ename like '%s%';

--13. List names of employees whose names have “i” as the second character.

select ename from emp where ename like '_i%';

--14. List the number of employees working with the company.
select count(ename) as total_employees_in_the_company from emp;

--15. List the number of designations available in the EMP table.
select count(distinct job) from emp;

--16. List the total salaries paid to the employees.
select sum(sal) as total_salary from emp;

--17. List the maximum, minimum and average salary in the company.
select max(sal) as max_salary, min(sal) as min_salary, avg(sal) as avg_salary from emp;

--18. List the maximum salary paid to a salesman.
select max(sal) as salesman_max_Salary from emp where job = 'salesman';

--19. List the number of employees and average salary for employees in department 20.

select max(sal) as dept20_max_Sal, avg(sal) as dept20_avg_sal from emp where deptno = 20;

--20. List name, salary and PF amount of all employees. (PF is calculated as 10% of basic
salary)
select ename, sal, sal * .10 as PF from emp;

--21. List names of employees who are more than 2 years old in the company.
select ename from emp where doj - getdate() > 730

--22. List the employee details in the ascending order of their basic salary.
select * from emp order by sal desc;

--23. List the employee name and hire date in the descending order of the hire date.

select ename, doj from emp order by doj desc;

--24. List employee name, salary, PF, HRA, DA and gross; order the results in the ascending order of gross. HRA is 50% of the salary and DA is 30% of the salary.


select ename, sal, sal * .1 as PF, sal * .5 as HRA, sal *.3 as DA , sal * .9 as gross  from emp order by gross ;


--25. List the department numbers and number of employees in each department.
select  deptno, count(deptno) as department_total from emp group by deptno;

--26. List the department number and total salary payable in each department.
select deptno, sum(sal) as department_total_salary from emp group by deptno;

--27. List the jobs and number of employees in each job. The result should be in the descending order of the number of employees.
select job, count(job) as no_of_emp from emp group by job order by no_of_emp desc;

--28. List the total salary, maximum and minimum salary and average salary of the employees jobwise.
select job, max(sal) as max_sal, min(sal) as min_sal,sum(sal) as total_sal, avg(sal) as avg_sal from emp group by job;

--29. List the total salary, maximum and minimum salary and average salary of the employees, for department 20.
select sum(sal) as total_sal, max(sal) as max_Sal, min(sal) as min_sal, avg(sal) as avg_sal from emp where deptno =20;

--30. List the total salary, maximum and minimum salary and average salary of the employees jobwise, for department 20 and display only those rows having an average salary > 1000.

select sum(sal) as total_sal, max(sal) as max_Sal, min(sal) as min_sal, avg(sal) as avg_sal from emp  where deptno =20  group by job having avg_sal > 1000;

--31.Display each ename, hiredate, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000. ”
--ans for this question is Vendor specific , and  I will answer this question latter.

--32. Print list of emp displaying “Good salary” if sal > 3000, “Average salary” if sal=3000 and “Poor salary” if sal < 3000.
--stored procedure with cursors

--33.Write a query to calculate the length of any emp has been with the company. Display in number of years and months.
--This answer is vendor specific , You can write custom stored procedure

--joins
--1. List employees located in BOSTON
select ename from emp right outer join dept on emp.deptno = dept.deptno where dept.loc = 'boston';

--2 . List deptno, dname along with total salary in each dept

select dept.deptno, dname, sum(sal) from emp  right outer join  dept on emp.deptno = dept.deptno group by deptno;

--3. List emp and dept details for deptno 30 and 40.

select empno, ename, job, mgrid, doj, sal, comm, emp.deptno, loc, dname from emp right outer join dept on dept.deptno = emp.deptno where emp.deptno in (30, 40);


--4. List all emp who earn less than their managers. List their managers details also.
select a.empno, a.ename, a.sal, b.ename as managerName, b.mgrid as mgrid, b.sal from emp as a, emp as b where a.mgrid = b.empno and a.sal < b.sal;

--5.Find the job that was filled in first half of 02 and the same job that was filled during first half of 03

--6. Find all emp who joined the company before their manager
select a.empno, a.ename, a.doj, b.ename as managerName, b.doj as mgr_doj  from emp as a, emp as b where a.mgrid = b.empno and a.doj < b.doj;

--Nested queries
--1. list the emp belonging to the dept of MILLER
select distinct ename from emp where deptno = (select deptno from emp where ename = 'miller') and ename != 'miller';

--2. 2. list the names of the emp drawing the highest sal
select ename from emp where sal = (select max(sal) from emp);

--3. list the job with the highest avg sal














