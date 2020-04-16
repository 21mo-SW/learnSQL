--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT C.NAME 
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID    
    AND PUBLISHER IN(SELECT PUBLISHER
                     FROM CUSTOMER C1, BOOK B1, ORDERS O1
                     WHERE C1.CUSTID = O1.CUSTID
                     AND O1.BOOKID = B1.BOOKID
                     AND C1.NAME = '������')
                     AND NAME != '������';

--�� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT NAME, COUNT(PUBLISHER)
FROM CUSTOMER C, ORDERS O, BOOK B 
WHERE  C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID
GROUP BY NAME
HAVING COUNT(DISTINCT PUBLISHER) >= 2;

--�� ���� ������� ����
SELECT NAME
FROM CUSTOMER C1
WHERE 2 <= (SELECT COUNT(DISTINCT PUBLISHER)
            FROM CUSTOMER, ORDERS, BOOK
            WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
            AND ORDERS.BOOKID = BOOK.BOOKID
            AND CUSTOMER.NAME LIKE C1.NAME);

--��ü ���� 30% �̻��� ������ ����
SELECT BOOKNAME, COUNT(BOOK.BOOKID)
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID
GROUP BY BOOKNAME
HAVING COUNT(ORDERS.BOOKID) >= 0.3*(SELECT COUNT(*) FROM CUSTOMER);

--�� ���� �������
SELECT BOOKNAME
FROM BOOK B1
WHERE (SELECT COUNT(ORDERS.BOOKID)
       FROM BOOK, ORDERS
       WHERE BOOK.BOOKID = ORDERS.BOOKID
        AND BOOK.BOOKID = B1.BOOKID) >= 0.3*(SELECT COUNT(*) FROM CUSTOMER);


--���ο� ����('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���.
--������ �ȵ� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
        VALUES(11, '����������', '���ѹ̵��', 10000);

--'�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�.
DELETE FROM BOOK
WHERE PUBLISHER = '�Ｚ��';

--'�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
DELETE FROM BOOK
WHERE PUBLISHER = '�̻�̵��';

SELECT CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C007422';

--���ǻ�'���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���.
UPDATE BOOK
SET PUBLISHER = '�������ǻ�'
WHERE PUBLISHER = '���ѹ̵��';
