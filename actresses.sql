-- Active: 1760379344819@@10.6.7.148@5432@db_mz
CREATE TABLE public.actresses
(
    name1 VARCHAR(20) PRIMARY KEY,
    name2 VARCHAR(20),
    name3 VARCHAR(20),
    birthday DATE,
    nationality CHAR(2)
);
CREATE TABLE public.movie_info
(
    movie_id VARCHAR(20) PRIMARY KEY,
    movie_release_date DATE,
    actress VARCHAR(20) DEFAULT 'Unknow',
    movie_bt TEXT,

    FOREIGN KEY(actress) REFERENCES actresses(name1) ON DELETE SET DEFAULT
);
ALTER TABLE movie_info ADD COLUMN theme CHAR(2);
ALTER TABLE movie_info RENAME COLUMN theme TO movie_theme;
DROP TABLE schema_test.table_test;

SELECT *
-- FROM movie_info
FROM actresses
-- WHERE name1 LIKE '%天%'
ORDER BY birthday DESC ;
SELECT t1.name1, count(t2.movie_id)
FROM actresses AS t1 LEFT JOIN movie_info AS t2
ON t1.name1 = t2.actress
GROUP BY t1.name1;

INSERT INTO movie_info
VALUES
('WANZ-962', '2020-06-27', '花音うらら', '/MzBackup00/Medias/Movies/Others/bts/', NULL),
('MBDD-2095', '2023-09-15', '花音うらら', '/MzBackup00/Medias/Movies/Others/bts/', NULL)
;
INSERT INTO actresses
VALUES
('坂井なるは', 'Sakai Naruha', '坂井成羽', '2002-09-30', 'JP')
;
UPDATE movie_info
SET movie_id = 'MIAD-738'
WHERE movie_id = 'MIDA-738';