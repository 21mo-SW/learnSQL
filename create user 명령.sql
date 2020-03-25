alter session set "_ORACLE _SCRIPT"=true;
CREATE USER c##cos IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO cos; 
GRANT CREATE TABLESPACE TO cos;
GRANT CREATE TABLE TO cos;
GRANT select, insert, delete, update ON cos.player TO cos;
alter user cos default tablespace users quota unlimited on users;

alter session set "_ORACLE_SCRIPT"=true;

@C:\scott.sql;