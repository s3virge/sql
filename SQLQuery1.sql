/*
1. Write a query in SQL to display the full name (first and last), hire date, salary, and department number for those employees whose first name does not containing the letter M 
and make the result set in ascending order by department number. 
*/
select first_name, last_name, hire_date, salary, department_id from employees where first_name not like '%M%' order by department_id ;

/*
2. Write a query in SQL to display all the information of employees whose salary is in the range of 8000 and 12000 and commission is not null 
or department number is except the number 40, 120 and 70 and they have been hired before June 5th, 2002.
*/
select * from employees 
where salary between 8000 and 12000 
and commission_pct is not NULL 
or department_id not in (40, 120, 70)
and hire_date < '2002-01-05';

/*
3. Write a query in SQL to display the full name (first and last), the phone number and email separated by hyphen, and salary, 
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
--select first_name, last_name, salary, department_id from employees order by salary;

select first_name, last_name, salary, department_id from employees
where salary in (select min(salary) from employees GROUP BY department_id );

/*
12. Write a query to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary.
*/
select emplyee_id, first_name, last_name from employees
where salary > (select AVG(salary) from employees);

/*
13. Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to Payam.
*/
-- manager id = employee_id
select * from employees where first_name = 'Payam' or last_name = 'Payam';
select first_name, last_name, emplyee_id, salary from employees;

select first_name, last_name, emplyee_id, salary, manager_id, job_id from employees
where manager_id = (
select emplyee_id from employees where first_name = 'Payam' or last_name = 'Payam'
);

/*
14. Write a query to display the department number, name ( first name and last name ), job and department name for all employees in the Finance department.
*/
select employees.department_id, first_name, last_name, job_id, departments.department_name from employees 
inner join departments on employees.department_id = departments.department_id
where departments.department_name = 'Finance';

/*
15. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121 respectively.
*/
select * from employees 
where salary = 3000 and manager_id = 121;

/*
16. Display all the information of an employee whose id is any of the number 134, 159 and 183.
*/ 
select * from employees 
where emplyee_id in (134, 159, 186);

/*
17. Write a query to display all the information of the employees whose salary is within the range 1000 and 3000.
*/
select * from employees
where salary between 1000 and 3000;

/*
18. Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.
*/
select * from employees
where salary between (select min(salary) from employees) and 2500;

/*
19. Write a query to display all the information of the employees who does not work in those departments 
where some employees works whose manager id within the range 100 and 200.
*/
select * from employees
where department_id in
(select department_id from employees where manager_id not between 100 and 200);

/*
20. Write a query to display all the information for those employees whose id is any id who earn the second highest salary
*/
select * from employees;
select salary from employees order by salary desc;
select max(salary) from employees where salary < (select max(salary) from employees);
select emplyee_id from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));
select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

/*
21. Write a query to display the employee name( first name and last name ) and hire date for all employees in the same department as Clara. Exclude Clara
*/
select first_name, last_name, hire_date, department_id from employees
where department_id = (select department_id from employees where first_name = 'Clara')
and not first_name = 'Clara';

/*
22. Write a query to display the employee number and name( first name and last name ) for all employees who work in a department with any employee whose name contains a T.
*/
--WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
--WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
select emplyee_id, first_name + ' ' + last_name as [Full Name] from employees 
where department_id in (select department_id from employees where first_name like '%T%');

/*
23. Write a query to display the employee number, name( first name and last name ), and salary for all employees 
who earn more than the average salary and who work in a department with any employee with a J in their name.
*/
select emplyee_id, first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees) 
and department_id in (select department_id from employees where first_name like '%J%');

/*
23. Write a query to display the employee number, name( first name and last name ), and salary for all employees 
who earn more than the average salary and who work in a department with any employee with a J in their name.
*/
select emplyee_id, first_name, last_name, salary from employees 
where department_id in (select department_id from employees where first_name like '%J%') 
and salary > (select avg(salary) from employees);

/*
24. Display the employee name( first name and last name ), employee id, and job title for all employees whose department location is Toronto.
*/
select location_id from locations where city = 'Toronto';
select department_id, location_id from departments;
select * from employees where department_id = (select department_id from departments where location_id = (select location_id from locations where city = 'Toronto'));

select first_name, last_name, emplyee_id, job_id from employees
where department_id = (select department_id from departments where location_id = (select location_id from locations where city = 'Toronto'));

/*
25. Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.
*/
select emplyee_id, first_name, last_name, job_id from employees
where salary < (select min(salary) from employees where job_id = 'MK_MAN');

/*
26. Write a query to display the employee number, name( first name and last name ) and job title for all employees 
whose salary is smaller than any salary of those employees whose job title is MK_MAN. Exclude Job title MK_MAN.
*/
select emplyee_id, first_name, last_name, job_id from employees
where salary < (select min(salary) from employees where job_id = 'MK_MAN')
and not job_id = 'MK_MAN';

/*
27. Write a query to display the employee number, name( first name and last name ) and job title for all employees 
whose salary is more than any salary of those employees whose job title is PU_MAN. Exclude job title PU_MAN.
*/
select emplyee_id, first_name, last_name, job_id from employees
where salary > (select max(salary) from employees where job_id = 'PU_MAN')
and not job_id = 'PU_MAN';

/*
28. Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is more than any average salary of any department.
*/
select * from employees; --6461
select emplyee_id, first_name, last_name, job_id, salary from employees order by salary desc;

select department_id from employees
/*get list of dipartments*/
select department_id from employees group by department_id
select AVG(salary) from employees group by department_id
/*
The ANY operator returns true if any of the subquery values meet the condition.
The ALL operator returns true if all of the subquery values meet the condition.
*/

SELECT emplyee_id, first_name, last_name, job_id, salary FROM employees 
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY department_id);

