-- Active: 1761285273419@@10.6.7.148@5432@db_mz
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
SELECT *
FROM actresses LEFT JOIN movie_info;
SELECT *
FROM movie_info;
INSERT INTO movie_info
VALUES
('MDYD-987', '2015-01-10', '涼宮琴音', NULL, NULL);
UPDATE movie_info
SET movie_id = 'MIAD-738'
WHERE movie_id = 'MIDA-738';