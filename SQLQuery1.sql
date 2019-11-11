select * from employees;

/*
3. Write a query in SQL to display the full name (first and last), 
the phone number and email separated by hyphen, and salary, 
for those employees whose salary is within the range of 9000 and 17000. 
The column headings assign with Full_Name, Contact_Details and Remuneration respectively.
*/
select first_name + ' ' + last_name as [Full Name], 
phone_number + ' - ' + email as Contact_Details,
salary as Remuneration
from employees where salary between 9000 and 17000;

/*
4. Write a query in SQL to display the full name (first and last) name, and salary, 
for all employees whose salary is out of the range 7000 and 15000 
and make the result set in ascending order by the full name.
*/
select first_name, last_name, salary from employees where salary not between 7000 and 15000 order by first_name;

/*
5. Write a query in SQL to display the full name (first and last), job id and date of hire for those employees
who was hired during November 5th, 2007 and July 5th, 2009
*/
select first_name, last_name, job_id, hire_date from employees where hire_date between '2007-11-05' and '2009-06-05';
select first_name, last_name, job_id, hire_date from employees where hire_date between '2007-11-05' and '2009-06-05' order by hire_date;

/*
6. Write a query in SQL to display the full name (first name and last name), hire date, commission percentage, email and telephone separated by '-', 
and salary for those employees who earn the salary above 11000 or the seventh digit in their phone number equals 3 and make the result set in a descending order by the first name.
*/
select first_name + ' ' + last_name as [Full Name], hire_date, commission_pct, email + '-' + phone_number as [Email-phone], salary from employees
where salary > 11000
or phone_number LIKE '______3%'
order by first_name desc;

/*
7. Write a query in SQL to display the employee ID, first name, job id, and department number for those employees who is working except the departments 50,30 and 80.
*/
select emplyee_id, first_name, job_id, department_id from employees
where department_id not in (50, 30, 80);

/*
8. Write a query in SQL to display the ID for those employees who did two or more jobs in the past.
*/
select * from job_history;
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(employee_id) >= 2;

/*
9. Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 163.
*/
select first_name, last_name, salary from employees 
where salary > (select salary from employees where emplyee_id = 163);

/*
10. Write a query to display the name ( first name and last name ), salary, department id, job id 
for those employees who works in the same designation as the employee works whose id is 169.
*/
select first_name, last_name, salary, department_id, job_id from employees
where job_id = (select job_id from employees where emplyee_id = 169);

/*
11. Write a query to display the name ( first name and last name ), salary, department id for those employees 
who earn such amount of salary which is the smallest salary of any of the departments.
*/
select first_name, last_name, salary, department_id from employees order by salary;
select first_name, last_name, salary, department_id from employees
where salary in (select min(salary) from employees GROUP BY department_id );