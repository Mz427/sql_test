-- Active: 1760379344819@@10.6.7.148@5432@db_mz@public
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
FROM movie_info;
-- FROM actresses;
SELECT t1.name1, COUNT(t2.movie_id) AS movie_count
FROM actresses AS t1 LEFT JOIN movie_info AS t2
ON t1.name1 = t2.actress
GROUP BY t1.name1
HAVING COUNT(t2.movie_id) >= 2;
INSERT INTO movie_info
VALUES
('MDYD-987', '2015-01-10', '涼宮琴音', NULL, NULL),
('MDYD-987', '2015-01-10', '涼宮琴音', NULL, NULL);
UPDATE movie_info
SET movie_id = 'MIAD-738'
WHERE movie_id = 'MIDA-738';