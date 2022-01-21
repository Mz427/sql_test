CREATE TABLE OpenCourses
(
	month char(6),
	course_id char(3) REFERENCES coursemaster(course_id)
);
ALTER TABLE poptbl 
ADD sex int;
ALTER TABLE opencourses 
DROP CONSTRAINT opencourses_pkey;
ALTER TABLE opencourses 
RENAME month TO courses_month;
TRUNCATE coursemaster RESTART IDENTITY;

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

UPDATE SomeTable 
SET p_key = CASE p_key 
	WHEN 'a' THEN 'c'
	WHEN 'c' THEN 'a'
	ELSE p_key 
	END 
WHERE p_key IN ('a', 'c');

INSERT INTO opencourses 
VALUES 
('200706', '1'),
('200706', '3'),
('200706', '4'),
('200707', '4'),
('200708', '2'),
('200708', '4');


SELECT course_name,
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200706' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "6月",
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200707' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "7月",
	CASE WHEN EXISTS  
		(
			SELECT course_id
			FROM opencourses oc
			WHERE courses_month = '200708' AND cm.course_id = oc.course_id
		)
		THEN 'o'
		ELSE 'x'
	END AS "8月"
FROM coursemaster cm

