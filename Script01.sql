CREATE TABLE StudentClub
(
	std_id char(3),
	club_id char(1),
	club_name char(6),
	main_club_flg char(1)
);
ALTER TABLE poptbl 
ADD sex int;
ALTER TABLE opencourses 
DROP CONSTRAINT opencourses_pkey;
ALTER TABLE opencourses 
RENAME month TO courses_month;
TRUNCATE coursemaster RESTART IDENTITY;
UPDATE SomeTable 
SET p_key = CASE p_key 
	WHEN 'a' THEN 'c'
	WHEN 'c' THEN 'a'
	ELSE p_key 
	END 
WHERE p_key IN ('a', 'c');
INSERT INTO studentclub 
VALUES 
('100', '1', '棒球', 'Y'),
('100', '2', '管弦乐', 'N'),
('200', '2', '管弦乐', 'N'),
('200', '3', '羽毛球', 'Y'),
('200', '4', '足球', 'N'),
('300', '4', '足球', 'N'),
('400', '5', '游泳', 'N'),
('500', '6', '围棋', 'N');
SELECT *
FROM pg_catalog.pg_tables 
WHERE tableowner = 'mz';
SELECT *
FROM studentclub;

/*****************************************************************************/
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

SELECT pref_name,
	sum(CASE sex WHEN 1 THEN population ELSE 0 END) AS 男,
	sum(CASE sex WHEN 2 THEN population ELSE 0 END) AS 女
FROM poptbl p 
GROUP BY pref_name;

/*****************************************************************************/
SELECT course_name,
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200706' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "june",
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200707' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "july",
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200708' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "august"
FROM coursemaster cm;

SELECT course_name, 
	CASE 
		WHEN EXISTS
		(
			SELECT *
			FROM opencourses o 
			WHERE courses_month = '200706' AND course_id = c.course_id 
		)
		THEN 'o'
		ELSE 'x'
	END AS "june",
	CASE 
		WHEN EXISTS
		(
			SELECT *
			FROM opencourses o 
			WHERE courses_month = '200707' AND course_id = c.course_id 
		)
		THEN 'o'
		ELSE 'x'
	END AS "july",
	CASE 
		WHEN EXISTS
		(
			SELECT *
			FROM opencourses o 
			WHERE courses_month = '200708' AND course_id = c.course_id 
		)
		THEN 'o'
		ELSE 'x'
	END AS "august"
FROM coursemaster c;

/*****************************************************************************/