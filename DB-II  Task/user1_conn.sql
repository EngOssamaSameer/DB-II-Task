create table Department (
  id number primary key,
  department_name varchar2(50) not null);
create table Employees (
  id number primary key,
  name varchar2(100) not null,
  salary number not null,
  department_id number references Department(id));
  
insert into Department values(1,'HR');
insert into Department values(2,'IT');
insert into Department values(3,'finance');

grant insert on Employees to user2;

/* select from employees table*/
select * from employees;

/* function to raise salary*/
create or replace function raise_salary return number as
    raise_percentage constant number := 10; 
begin
    update Employees
    set salary = salary + (salary * raise_percentage / 100) where department_id = 1;
    return raise_percentage;
end;
/* call function */
set serveroutput on;
declare
    applied_raise_percentage number;
begin
    applied_raise_percentage := raise_salary();
    DBMS_OUTPUT.PUT_LINE('Salaries raised by ' || applied_raise_percentage || '% for all employees.');
end;


/* grant execute function to user2*/
grant execute on raise_salary to user2;


/* commit to slover bloacker waiting problem */
commit;


/* deadlock*/
grant update on Employees  to user2;
 
 
 
 /* update employee 1 */ 
update Employees set salary = salary + salary * 0.1 where Employees.ID = 1;


 /* update employee 2 */ 
update Employees set salary = salary + salary * 0.1 where Employees.ID = 2;

select * from employees



/*Create a function that calculates the average salary for any department */
create or replace function avg_salary(dept_id number)
return number IS avg_sal number;
begin
    select avg(salary)
    into avg_sal
    from employees
    where department_id = dept_id;
    return avg_sal;
end;
/* executer avg_salary function */
set serveroutput on;
declare avg_sal number;
begin
    avg_sal := avg_salary(1);
    DBMS_OUTPUT.PUT_LINE('Average Salary is: ' || avg_sal);
end;




/*Create a function that calculates the Total Salary in a Department. */
create or replace function  total_salary(dept_id number)
return number is total_sal number;
begin
    select sum(salary)
    into total_sal
    from employees
    where department_id = dept_id;
    return total_sal;
end;

/* execute total salary function*/
declare total_sal number;
begin
    total_sal := total_salary(2);
    DBMS_OUTPUT.PUT_LINE('Total Salary is :'|| total_sal);
end;

/*Create a function that calculates the maximum Salary.*/
create or replace function max_salary return number
is max_sal number;
begin
    select max(salary)
    into max_sal
    from employees;
    return max_sal;
end;

/* execute max_salary function */
declare
    max_sal number;
begin
    max_sal := max_salary();
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || max_sal);
end;




