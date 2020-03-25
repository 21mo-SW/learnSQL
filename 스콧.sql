-- Describe (����)
DESC emp;

SELECT EMPNO, ENAME, SAL
FROM emp;

SELECT *
FROM EMP;

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM EMP;

SELECT *
FROM emp
where sal = 1250 and comm > 1000;

--ENAME �� WARD�� ����� �˻��Ͻÿ�.
SELECT *
FROM emp
WHERE ename = 'WARD';

--JOB �� SALESMAN�� ����� �˻��Ͻÿ�.
SELECT *
FROM emp
WHERE job = 'SALESMAN';

--JOB �� SALESMAN�̰� DEPTNO�� 30�� ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND deptno = 30;

-- �ѹ��� : �츮 ȸ�翡 JOB�� �Ӱ� �ִ��� ����;�!!
SELECT DISTINCT job
FROM emp;

--�ѹ��� : �츮 ȸ�翡 �μ���ȣ�� �Ӱ� �ִ��� ���� �;�!! DEPTNO(��Ī�ٲٱ�)
SELECT DISTINCT DEPTNO �μ���ȣ
FROM emp;

DESC student;

SELECT *
FROM STUDENT
WHERE HEIGHT >= 170;

--STUDENT���̺��� GRADE(�г�)DL 2�г��̰ų� 3�г��� �л��� �˻��Ͻÿ�.
SELECT *
FROM STUDENT
WHERE GRADE = 2 or grade =3;

--����(query) -> �Ľ�(parsing)
SELECT *
FROM STUDENT
WHERE GRADE in(2,3);

--EMP ���̺��� JOB�� SALESMAN �̰ų� MANAGER �̰ų� CLERK �� ����� ã���ÿ�
SELECT *
FROM emp
WHERE JOB in('SALESMAN','MANAGER','CLERK');

--EMP ���̺��� �̸��� M���� ���۵Ǵ� ����� ã���ÿ�.
SELECT SUBSTR('CRIS',1,2)
FROM DUAL;

SELECT *
FROM EMP
WHERE SUBSTR(ENAME,1,1) = 'M';

--STUDENT
SELECT *
FROM STUDENT
WHERE SUBSTR(JUMIN,1,2) = '76';

--STUDENT���� �λ꿡 ��� ����� ã���ÿ�
SELECT *
FROM STUDENT
WHERE SUBSTR(TEL,1,3) = '051';

--2���� �¾ ����� ã���ÿ�
SELECT *
FROM STUDENT
WHERE SUBSTR(BIRTHDAY,3,3) = '/02';

SELECT SUBSTR(TEL,INSTR(TEL,')')+1,


+1
FROM STUDENT;

SELECT INSTR(TEL,'-') - INSTR(TEL,')') - 1, TEL
FROM STUDENT;

SELECT ENAME, SAL || '$'
FROM EMP;

--76p ��뿹
SELECT NAME, SUBSTR(JUMIN,3,4) "BIRTHDAY",
             SUBSTR(JUMIN,3,4) -1 "BIRTHDAY - 1"
FROM STUDENT
WHERE DEPTNO1 = 101;

--78p ��뿹1
SELECT NAME, TEL, INSTR(TEL,')')
FROM STUDENT
WHERE DEPTNO1 = 201;

--79p ��뿹2
SELECT NAME, TEL, SUBSTR(TEL,'3')
FROM STUDENT
WHERE DEPTNO1 =101;

--79p ����
SELECT NAME, TEL, SUBSTR(TEL, 1, INSTR(TEL,')')-1) "AREA CODE"
FROM STUDENT
WHERE DEPTNO1 = 201;

SELECT REPLACE('ABC', 'AB', 'F')
FROM DUAL;

SELECT RPAD(SUBSTR(JUMIN,1,7), 13, '*')
FROM STUDENT;

SELECT REPLACE(JUMIN, SUBSTR(JUMIN,8), '******')
FROM STUDENT;

SELECT REPLACE(
               TEL, 
               SUBSTR(TEL, 1, INSTR(TEL,')') - 1),              
               SUBSTR('***', 1, INSTR(TEL, ')') - 1)            
                )
FROM STUDENT;

--REPLACE ���� 3
SELECT NAME, TEL, REPLACE(
                          TEL, 
                          SUBSTR(TEL, INSTR(TEL,')') + 1, INSTR(TEL, '-') - INSTR(TEL,')') -1), 
                          SUBSTR('****', 1, INSTR(TEL, '-') - INSTR(TEL,')') -1)
                        )
                        FROM STUDENT;
                        
--��¥�˻�
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT HIREDATE
FROM emp
WHERE HIREDATE = '1980-12-17';

--BETWEEN
SELECT *
FROM EMP
WHERE SAL >=1500 AND SAL <=2000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 1500 AND 2000;

--LIKE: �˻��� �� ���� �����
SELECT *
FROM EMP
WHERE ENAME LIKE 'A%';

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%N';

SELECT *
FROM EMP
WHERE ENAME LIKE '%N%';

--NULL �� NOT NULL ã����
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

SELCET *
FROM EMP
WHERE COMM IS NULL;

--������߿� ���ʽ��� 500���� ���� ���!!
SELECT ENAME SAL, NVL(COMM,0)
FROM EMP
WHERE NVL(COMM, 0) < 500;

SELECT NVL(NULL, 0), NVL(100,0)
FROM DUAL;

--�����Ͽ� ����ϱ�
SELECT *
FROM EMP
WHERE SAL >1000
ORDER BY SAL DESC;

--���� ���� �Լ���
SELECT POWER(2,64)
FROM DUAL;

SELECT MOD(121, 10), CEIL(123.45), FLOOR(123.45)
FROM DUAL;

SELECT TRUNC(987.654,2) "TRUNC1"
FROM DUAL;

--89p ���� 110p������ å���� ȥ���غ��� (��¥ ���� �Լ���)
--���� ��¥ �� �ð� ���
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT SYSDATE
FROM DUAL;

--DECODE()�Լ�
SELECT DECODE('LOVE', 'LOVE', '��', '����')
FROM DUAL;

select * from professor;

select deptno, name, decode(deptno, 101 , 'Computer Engineering', ' ')
from professor;

--115p
select deptno, name , decode(deptno , 101, 'Computer Engineering', 'ETC')
from professor;

--116p
select deptno, name, decode(deptno, 101, 'Computer Engineering', 
                                    102,'Multimedia Engineering', 
                                    103, 'Software Engineering' ,
                                    'ETC')
from professor;

--117p
select deptno, name, decode(deptno, 101, decode(name, '������', 'BEST!', ' '), ' ')
from professor;

--118p
select deptno, name, decode(deptno, 101, decode (name, '������', 'BEST!', 'GOOD!'), ' ')
from professor;

--119p
select deptno, name, decode(deptno, 101, decode (name, '������', 'BEST!', 'GOOD!'), 'N/A')
from professor;

--120p Quiz 1
select name, jumin , decode(substr(jumin, 7, 1), 1, 'MAN', 'WOMAN')
from student
WHERE DEPTNO1 = 101;

--120p Quiz 2
select name, tel, decode(substr(tel, 1, INSTR(TEL,')')-1), 
                        '02', 'SEOUL', '031', 'GYEONGGI', '051', 'BUSAN', '052', 'ULSAN', '055', 'GYEONGNAM')
FROM STUDENT
WHERE DEPTNO1 = 101;

--ORDER BY
SELECT ENAME, SUBSTR(SAL, 1, 1)
FROM EMP
ORDER BY 2 DESC;

--3��
SELECT COUNT(ENAME)
FROM EMP;

--�׷�ȭ
SELECT MAX(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT MAX(SAL), EMPNO
FROM EMP
GROUP BY EMPNO;

SELECT MAX(SAL), JOB
FROM EMP
GROUP BY JOB;

SELECT SUM(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO
ORDER BY 1 DESC;

SELECT COUNT(*), JOB
FROM EMP
GROUP BY JOB;

--HAVING
SELECT FLOOR (AVG(SAL)), JOB
FROM EMP
GROUP BY JOB
HAVING JOB != 'MANAGER';

SELECT DEPTNO, FLOOR (AVG(NVL(SAL,0)))
FROM EMP
GROUP BY DEPTNO
HAVING AVG(NVL(SAL,0)) > 2000;

SELECT *
FROM GOGAK;

SELECT MAX(POINT)
FROM GOGAK;

--ROWNUM�� UNION ALL
SELECT MAX(POINT)
FROM GOGAK
WHERE ROWNUM > 0 AND ROWNUM < 9
UNION ALL
SELECT MAX(POINT)
FROM 
(SELECT GNO, POINT, ROWNUM "NO" FROM GOGAK)
WHERE NO > 8 AND NO < 21;

--1�� 2�� �׷�ȭ
SELECT GNO, GNAME, POINT , NO, 
CASE WHEN NO BETWEEN 1 AND 10 THEN 1
     WHEN NO BETWEEN 11 AND 20 THEN 2
END "GID"
FROM
(
SELECT GNO, GNAME, POINT, ROWNUM "NO"
FROM GOGAK
);

--�׷�ȭ�ؼ� 2�� ���
SELECT MAX(POINT)
FROM
(
    SELECT GNO, GNAME, POINT, NO,
    CASE WHEN NO < 9 THEN 1 ELSE 2 END "G"
    FROM
    (
        SELECT GNO, GNAME, POINT, ROWNUM "NO"
        FROM GOGAK
    )
)
GROUP BY G;

--�ߺ� ����
SELECT DISTINCT JOB
FROM EMP;

--�������� (SELECT �ȿ� SELECT�� ���°�)
SELECT *
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);