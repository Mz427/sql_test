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
SELECT *
FROM actresses;
DROP table movies;
ALTER TABLE movie_info ADD COLUMN theme CHAR(2);
ALTER TABLE movie_info RENAME COLUMN theme TO movie_theme;
INSERT INTO movie_info
VALUES
('H4610-KI200823', '2020-08-22', '下山真由美', NULL, 'CC');
INSERT INTO actresses
VALUES
('美智子小夜曲', 'Michiko Serenade', '內田美奈子', '1980-11-16', 'JP');
UPDATE actresses
SET birthday = '1980-02-18'
WHERE name1 = '美智子小夜曲';
SELECT *
FROM movie_info;