alter session set "_ORACLE _SCRIPT"=true;
CREATE USER c##cos IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO c##scott; 
GRANT CREATE TABLESPACE TO c##scott;
GRANT CREATE TABLE TO c##scott;
GRANT select, insert, delete, update ON scott.player TO scott;
alter user scott default tablespace users quota unlimited on users;

alter session set "_ORACLE_SCRIPT"=true;

@C:\scott.sql;