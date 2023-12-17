create user ossama_Manager identified by 123;
create role Manager_role ;
grant create session , create user , create table to Manager_role with admin option ;

grant Manager_role to ossama_Manager ;

/* alter user1 */
alter user user1 quota 100M on system;

/* grant create function to user2*/
grant create procedure to  user1;


/* select SID and sreail# for blocker and waiting usres*/
select 
    blocking_session.sid as blocking_sid,
    blocking_session.SERIAL# as blocking_serial,
    waiting_session.sid as waiting_sid,
    waiting_session.SERIAL# as waiting_serial
from 
    v$session blocking_session,
    v$session waiting_session
where 
    blocking_session.sid = waiting_session.BLOCKING_SESSION;

