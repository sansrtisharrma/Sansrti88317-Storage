use mysql;
use training21;

-- display all the information of the emp table 
select * from emp;

-- display unique jobs from emp table
select distinct(job) from emp;

-- list the emps in the asc order of their salaries
select ename,sal from emp
order by sal asc;

-- list the details of the emps in asc order of the deptnos and desc of jobs
select * from emp
order by deptno asc,job desc;

-- display all the unique job groups in the descending order
select distinct(job) from emp
order by job desc; 

-- display all the details of all mgrs
select * from emp
where job="manager";

-- list the emps who joined before 1981
select ename,hiredate from emp
where year(hiredate)<1981;

-- list the empno,ename, sal, daily sal of all emps in the asc order of annual
select empno, ename,sal, sal/30 as "daily sal"from emp
order by sal*12 asc;

-- display the empno, ename, job, hiredate , exp of all mgrs
select  empno, ename,job, hiredate, timestampdiff(year, hiredate,now()) as exp from emp
where job="manager";

-- list the empno, ename, sal, exp,of all emps working for mgr 7369
select empno,ename, sal,timestampdiff(year, hiredate,now()) as exp  from emp
where mgr=7369; 

-- display all the details of the emps whose comm is more than their sal
select * from emp
where comm>sal; 

-- list the emps along with their exp and daily sal is more than Rs.100
select ename,timestampdiff(year, hiredate,now()) as exp from emp
where sal/30 >100;

-- list the emps who are either 'clerk' or'analyst' in the desc order
select ename, job from emp
where job in('clerk','analyst')
order by ename desc;

-- list the emps who joined on 1-May-81, 3-dec-81, 17-dec-81, 19-jan-80 in asc order of seniority
select ename, hiredate  from emp
where hiredate in (1981-5-1,1981-12-3,1981-12-17,1980-1-19)
order by timestampdiff(year, hiredate,now());

-- list the emp who are working for the deptno 10 or 20
select ename,deptno from emp
where deptno in (10,20);

-- list the emps who joined in the year 81
select ename , hiredate from emp
where year(hiredate)=1981;

-- list the emps who annual sal rangingfrom 22000 and 45000
select ename from emp
where sal*12 between 22000 and 45000;

-- list the enames those are having five characters in their names
select ename from emp
where ename like "_____";

-- list the enames those are starting with "S"and five characters
select ename from emp
where ename like "S____";

-- list the emps those are having four chars and third character must be "R"
select ename from emp
where ename like "__r_";

-- list the five character names starting with "s" and ending with "h" 
select ename from emp
where ename like "s___h";

-- list the emps who joined in january
select ename, hiredate from emp
where monthname(hiredate)="january";

-- list the emps whose names having a character set"ll" together
select ename from emp
where ename like "%ll%";

-- list the emps who does not belong to deptno20
select ename, deptno from emp
where deptno <>20;

-- list all the emps except'president ' & 'mgr' in asc order of salaries
select ename, job, sal from emp
where job not in ('president','manager')
order by sal; 

-- list the emps whose empno not starting with digit 78
select ename ,empno from emp
where empno not like "78%";

-- list the emps who are working under 'mgr'
select * from emp
where mgr is not null;

-- list the emps who joined in any year but not belongs to the month of march
select ename, hiredate from emp
where monthname(hiredate)<>"march";

-- list all the clerks of deptno20
select ename from emp
where job="clerk" and deptno=20; 

-- list the emps of deptno30 or10 joined in the year 1981
select ename ,deptno,hiredate from emp
where deptno in (30,10) and year(hiredate)=1981;

-- display the details of smith
select * from emp
where ename="smith";

-- display the location of smith
select e. ename,d.loc from emp e, dept d
where e.deptno=d.deptno and e.ename="smith"; 