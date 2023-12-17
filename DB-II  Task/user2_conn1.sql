insert into user1.Employees values (1, 'John Doe', 500.00, 1);
insert into user1.Employees values (2, 'Jane Smith', 600.00, 2);
insert into user1.Employees values (3, 'Bob Johnson', 550.00, 1);
insert into user1.Employees values (4, 'Alice Brown', 700.00, 2);
insert into user1.Employees values (5, 'Charlie Davis', 650.00, 2);

commit;

/* call user1's function */
declare
    applied_raise_percentage number;
begin
    applied_raise_percentage := user1.RAISE_SALARY();
    DBMS_OUTPUT.PUT_LINE('Salaries raised by ' || applied_raise_percentage || '% for all employees.');
end;

/* deadlock*/
 /* update employee 2 */ 
update user1.Employees set salary = salary + salary * 0.1 where user1.Employees.ID = 2;



 /* update employee 1 */ 
update user1.Employees set salary = salary + salary * 0.1 where user1.Employees.ID = 1;







