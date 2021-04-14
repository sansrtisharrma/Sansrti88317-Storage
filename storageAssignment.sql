use mysql;
create database training21;
use training21;
create table dept(
deptno int not null,
dname varchar(20) not null,
loc varchar(30) not null);

-- drop and create apply key on column
drop table dept;
create table dept(
deptno int not null primary key,
dname varchar(20) not null,
loc varchar(30) not null);

-- drop and create apply key on table
drop table dept;
create table dept(
deptno int not null,
dname varchar(20) not null,
loc varchar(30) not null,
primary key(deptno));

-- Inserting the values in the table
insert into dept values(10,'Accounting','New York');
insert into dept values(20,'Research','Dhallas');
insert into dept values(30,'Sales','Chicago');
insert into dept values(40,'operations','Boston'); 
select * from dept;

-- creating table emp
create table emp(
empno int not null,
ename varchar(20),
job varchar(9),
mgr int,
hiredate datetime,
sal numeric(7,2),
comm numeric(7,2),
deptno int);
INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);
select * from dept;
select * from emp;

-- List all manager data
select * from emp where job='Manager';

-- list emp who are working as manager or analyst or clerk
select empno, ename , job from emp
where job in ('manager','analyst','clerk');

-- list emp who are earning sal between 3000 and 5000(inclusive of limit)
select empno,ename,sal from emp 
where sal between 3000 and 5000;

-- list emp who are working as manager or analyst or clerk and earning sal between 3000 and 5000
select empno,ename, job,sal from emp
where (job in ('manager','analyst','clerk')) and sal between 3000 and 5000;

-- list all emp who are earning comm
select empno,ename,comm from emp 
where comm is not null and comm<>0;

-- list all emp whose comm is not null
select empno,ename,comm from emp 
where comm is not null;

-- list all emp whose name starts with 'S'
select empno, ename,job from emp
where ename like 's%';

-- list all emp whose name ends with 'R'
select empno, ename,job from emp
where ename like '%r';

-- List all emp whose name contains 'A'
select empno, ename,job from emp
where ename like '%a%';

-- list all emp whose name contains 'a' as second letter
select empno, ename,job from emp
where ename like '_a%';

-- list all emp whose name starts with either m or s
select empno, ename,job from emp
where ename like 'm%' or ename like's%';

-- list all emp whose name starts between a to m
select empno, ename,job from emp
where ename  between 'a%' and'm%';

-- list all emp whose name contains _
select empno, ename,job from emp
where ename like '%\_%'  ;

-- list all emp who are working as manager in either dept 10 or 20 and all clerk for dept 30
select empno,ename, job, deptno from emp
where (job ='manager' and deptno in (10,20)) or (job='clerk' and deptno=30);

-- list ename ,sal and bonus as 10% of salary
select ename, sal, sal*0.1 as "Bonus" from emp;

-- list emp data as per the ascending order of name
select * from emp
order by ename;

-- list all as per their salary highest to lowest
select * from emp
order by sal desc;

-- list emp as per their dept, with in dept highest to lowest sal
select * from emp;
select * from dept;
select * from emp e, dept d
where e.deptno =d.deptno
order by d.dname,e.sal desc;

-- list top 3 highest paid emp
select * from emp
order by sal desc limit 3;

-- return sequential number rank based on specified criteria if two emp have same salary they both get same number and next number will be skipped
select empno,ename,job,sal,rank() over (order by sal desc) Ranking from emp;

-- return consecutive ranking values based on a specified criteria
select empno,ename,job,sal,dense_rank() over (order by sal desc) Ranking from emp;

-- list the different job name
select distinct(job) from emp;

-- list total organisation salary
select sum(sal) from emp;

-- list deptwise total salary
select d.dname, sum(e.sal) from dept d, emp e 
where d.deptno=e.deptno
group by d.dname;

-- list jobwise emp count
select * from emp;
select job,count(job)from emp 
group by job;

-- list all emp who have joined in month of feb
select ename, hiredate from emp
where monthname(hiredate)='february';

-- list emp count joined between 1981 and 1983
select count(*) from emp
where year(hiredate) between 1981 and 1983;

-- list how many years of service completed by each emp arrange based on tenure highest to lowest
select ename,timestampdiff(year, hiredate,now()) as "tenure"from emp
order by tenure desc;