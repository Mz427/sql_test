SELECT CASE pref_name
	WHEN '�µ�' THEN '�Ĺ�'
	WHEN '�㴨' THEN '�Ĺ�'
	WHEN '����' THEN '�Ĺ�'
	WHEN '��֪' THEN '�Ĺ�'
	WHEN '����' THEN '����'
	WHEN '����' THEN '����'
	WHEN '����' THEN '����'
	ELSE '����' END AS district, SUM( population)
FROM PopTbl
GROUP BY CASE pref_name
	WHEN '�µ�' THEN '�Ĺ�'
	WHEN '�㴨' THEN '�Ĺ�'
	WHEN '����' THEN '�Ĺ�'
	WHEN '��֪' THEN '�Ĺ�'
	WHEN '����' THEN '����'
	WHEN '����' THEN '����'
	WHEN '����' THEN '����'
	ELSE '����' END;

SELECT *
FROM poptbl p 

ALTER TABLE poptbl 
ADD sex int;
ALTER TABLE poptbl 
DROP CONSTRAINT poptbl_pkey

SELECT pref_name,
	sum(CASE sex WHEN 1 THEN population ELSE 0 END) AS 男,
	sum(CASE sex WHEN 2 THEN population ELSE 0 END) AS 女
FROM poptbl p 
GROUP BY pref_name;

CREATE TABLE SomeTable
(
	p_key char(1) PRIMARY KEY,
	col_1 int,
	col_2 char(2)
)
INSERT INTO SomeTable VALUES ()
)


