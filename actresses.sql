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
;
SELECT t1.name1, COUNT(t2.movie_id) AS movie_count
FROM actresses AS t1 LEFT JOIN movie_info AS t2
ON t1.name1 = t2.actress
GROUP BY t1.name1
HAVING COUNT(t2.movie_id) >= 2;
INSERT INTO movie_info
VALUES
('IPZ-721', '2016-03-26', '天海つばさ', 'magnet:?xt=urn:btih:91487C53DD01282AE2EA98B48C5B53A106C72EB2&size=4977720668&biz=ktr', NULL),
('SSPD-133', '2017-02-11', '天海つばさ', 'magnet:?xt=urn:btih:9B89923278E7A1218DC593B15A628A75D9001C9E&size=2876746156&biz=ktr', NULL)
;
INSERT INTO actresses
VALUES
('白桃はな', 'Shirato Hana', '白桃花', '2000-05-12', 'JP')
;
UPDATE movie_info
SET movie_id = 'MIAD-738'
WHERE movie_id = 'MIDA-738';
SELECT COALESCE(name2, 'aaa')
FROM actresses;