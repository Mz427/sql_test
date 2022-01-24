CREATE TABLE Greatests
(
	key_id char(1),
	x_id int,
	y_id int,
	z_id int
);
ALTER TABLE poptbl 
ADD sex int;
ALTER TABLE opencourses 
DROP CONSTRAINT opencourses_pkey;
ALTER TABLE opencourses 
RENAME month TO courses_month;
ALTER TABLE greatests SET SCHEMA mz_test;
TRUNCATE coursemaster RESTART IDENTITY;
DROP TABLE Greatests ;
UPDATE SomeTable 
SET p_key = CASE p_key 
	WHEN 'a' THEN 'c'
	WHEN 'c' THEN 'a'
	ELSE p_key 
	END 
WHERE p_key IN ('a', 'c');
INSERT INTO Greatests  
VALUES 
('A', 1, 2, 3),
('B', 5, 5, 2),
('C', 4, 7, 1),
('D', 3, 3, 8);
SELECT *
FROM pg_catalog.pg_tables 
WHERE tableowner = 'mz';
SELECT *
FROM Greatests ;

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
	sum(CASE sex WHEN 1 THEN population ELSE 0 END) AS �?,
	sum(CASE sex WHEN 2 THEN population ELSE 0 END) AS �?
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
SELECT key_id,
	CASE WHEN x_id >= y_id 
		THEN 
		(
			CASE WHEN x_id >= z_id 
				THEN x_id 
				ELSE z_id 
			END
		)
		ELSE
		(
			CASE WHEN y_id >= z_id 
				THEN y_id 
				ELSE z_id 
			END
		)
	END AS "max_xyz_id"
FROM Greatests;
