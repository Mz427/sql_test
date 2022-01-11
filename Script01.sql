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

insert into poptbl values('德岛', 100);
insert into poptbl values('香川', 200);
insert into poptbl values('爱媛', 150);
insert into poptbl values('高知', 200);
insert into poptbl values('福冈', 300);
insert into poptbl values('佐贺', 100);
insert into poptbl values('长崎', 200);
insert into poptbl values('东京', 400);
insert into poptbl values('群马', 50);

SELECT CASE pref_name
	WHEN '德岛' THEN '四国'
	WHEN '香川' THEN '四国'
	WHEN '爱媛' THEN '四国'
	WHEN '高知' THEN '四国'
	WHEN '福冈' THEN '九州'
	WHEN '佐贺' THEN '九州'
	WHEN '长崎' THEN '九州'
	ELSE '其他' END AS district, SUM( population)
FROM PopTbl
GROUP BY CASE pref_name
	WHEN '德岛' THEN '四国'
	WHEN '香川' THEN '四国'
	WHEN '爱媛' THEN '四国'
	WHEN '高知' THEN '四国'
	WHEN '福冈' THEN '九州'
	WHEN '佐贺' THEN '九州'
	WHEN '长崎' THEN '九州'
	ELSE '其他' END;

SELECT *
FROM mz_test.poptbl p 
	