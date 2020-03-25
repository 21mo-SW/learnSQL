-- Describe (설명)
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

--ENAME 이 WARD인 사람을 검색하시오.
SELECT *
FROM emp
WHERE ename = 'WARD';

--JOB 이 SALESMAN인 사람을 검색하시오.
SELECT *
FROM emp
WHERE job = 'SALESMAN';

--JOB 이 SALESMAN이고 DEPTNO가 30인 사람을 검색하시오
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND deptno = 30;

-- 총무과 : 우리 회사에 JOB이 머가 있는지 보고싶어!!
SELECT DISTINCT job
FROM emp;

--총무과 : 우리 회사에 부서번호가 머가 있는지 보고 싶어!! DEPTNO(별칭바꾸기)
SELECT DISTINCT DEPTNO 부서번호
FROM emp;

DESC student;

SELECT *
FROM STUDENT
WHERE HEIGHT >= 170;

--STUDENT테이블에서 GRADE(학년)DL 2학년이거나 3학년인 학생을 검색하시오.
SELECT *
FROM STUDENT
WHERE GRADE = 2 or grade =3;

--쿼리(query) -> 파싱(parsing)
SELECT *
FROM STUDENT
WHERE GRADE in(2,3);

--EMP 테이블에서 JOB이 SALESMAN 이거나 MANAGER 이거나 CLERK 인 사람을 찾으시오
SELECT *
FROM emp
WHERE JOB in('SALESMAN','MANAGER','CLERK');

--EMP 테이블에서 이름이 M으로 시작되는 사람을 찾으시오.
SELECT SUBSTR('CRIS',1,2)
FROM DUAL;

SELECT *
FROM EMP
WHERE SUBSTR(ENAME,1,1) = 'M';

--STUDENT
SELECT *
FROM STUDENT
WHERE SUBSTR(JUMIN,1,2) = '76';

--STUDENT에서 부산에 사는 사람을 찾으시오
SELECT *
FROM STUDENT
WHERE SUBSTR(TEL,1,3) = '051';

--2월에 태어난 사람을 찾으시오
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

--76p 사용예
SELECT NAME, SUBSTR(JUMIN,3,4) "BIRTHDAY",
             SUBSTR(JUMIN,3,4) -1 "BIRTHDAY - 1"
FROM STUDENT
WHERE DEPTNO1 = 101;

--78p 사용예1
SELECT NAME, TEL, INSTR(TEL,')')
FROM STUDENT
WHERE DEPTNO1 = 201;

--79p 사용예2
SELECT NAME, TEL, SUBSTR(TEL,'3')
FROM STUDENT
WHERE DEPTNO1 =101;

--79p 퀴즈
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

--REPLACE 퀴즈 3
SELECT NAME, TEL, REPLACE(
                          TEL, 
                          SUBSTR(TEL, INSTR(TEL,')') + 1, INSTR(TEL, '-') - INSTR(TEL,')') -1), 
                          SUBSTR('****', 1, INSTR(TEL, '-') - INSTR(TEL,')') -1)
                        )
                        FROM STUDENT;
                        
--날짜검색
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

--LIKE: 검색할 때 많이 사용함
SELECT *
FROM EMP
WHERE ENAME LIKE 'A%';

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%N';

SELECT *
FROM EMP
WHERE ENAME LIKE '%N%';

--NULL 과 NOT NULL 찾을때
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

SELCET *
FROM EMP
WHERE COMM IS NULL;

--사원들중에 보너스가 500보다 작은 사람!!
SELECT ENAME SAL, NVL(COMM,0)
FROM EMP
WHERE NVL(COMM, 0) < 500;

SELECT NVL(NULL, 0), NVL(100,0)
FROM DUAL;

--정렬하여 출력하기
SELECT *
FROM EMP
WHERE SAL >1000
ORDER BY SAL DESC;

--숫자 관련 함수들
SELECT POWER(2,64)
FROM DUAL;

SELECT MOD(121, 10), CEIL(123.45), FLOOR(123.45)
FROM DUAL;

SELECT TRUNC(987.654,2) "TRUNC1"
FROM DUAL;

--89p 부터 110p까지는 책보고 혼자해보기 (날짜 관련 함수들)
--오늘 날짜 및 시간 출력
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT SYSDATE
FROM DUAL;

--DECODE()함수
SELECT DECODE('LOVE', 'LOVE', '참', '거짓')
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
select deptno, name, decode(deptno, 101, decode(name, '조인형', 'BEST!', ' '), ' ')
from professor;

--118p
select deptno, name, decode(deptno, 101, decode (name, '조인형', 'BEST!', 'GOOD!'), ' ')
from professor;

--119p
select deptno, name, decode(deptno, 101, decode (name, '조인형', 'BEST!', 'GOOD!'), 'N/A')
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

--3장
SELECT COUNT(ENAME)
FROM EMP;

--그룹화
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

--ROWNUM과 UNION ALL
SELECT MAX(POINT)
FROM GOGAK
WHERE ROWNUM > 0 AND ROWNUM < 9
UNION ALL
SELECT MAX(POINT)
FROM 
(SELECT GNO, POINT, ROWNUM "NO" FROM GOGAK)
WHERE NO > 8 AND NO < 21;

--1과 2로 그룹화
SELECT GNO, GNAME, POINT , NO, 
CASE WHEN NO BETWEEN 1 AND 10 THEN 1
     WHEN NO BETWEEN 11 AND 20 THEN 2
END "GID"
FROM
(
SELECT GNO, GNAME, POINT, ROWNUM "NO"
FROM GOGAK
);

--그룹화해서 2행 출력
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

--중복 제거
SELECT DISTINCT JOB
FROM EMP;

--서브쿼리 (SELECT 안에 SELECT가 들어가는것)
SELECT *
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);