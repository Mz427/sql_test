create table poptbl
(
	pref_name char(12) primary key,
	population int
);

create table poptbl
(
	pref_name char(12) primary key,
	population int
);

insert into poptbl values('�µ�', 100);
insert into poptbl values('�㴨', 200);
insert into poptbl values('����', 150);
insert into poptbl values('��֪', 200);
insert into poptbl values('����', 300);
insert into poptbl values('����', 100);
insert into poptbl values('����', 200);
insert into poptbl values('����', 400);
insert into poptbl values('Ⱥ��', 50);

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
FROM mz_test.poptbl p 
	