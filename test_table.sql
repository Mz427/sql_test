--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-0+deb11u1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-0+deb11u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coursemaster; Type: TABLE; Schema: mz_test; Owner: mz
--

CREATE TABLE mz_test.coursemaster (
    course_id character(3) NOT NULL,
    course_name character(20)
);


ALTER TABLE mz_test.coursemaster OWNER TO mz;

--
-- Name: opencourses; Type: TABLE; Schema: mz_test; Owner: mz
--

CREATE TABLE mz_test.opencourses (
    courses_month character(6) NOT NULL,
    course_id character(3)
);


ALTER TABLE mz_test.opencourses OWNER TO mz;

--
-- Name: poptbl; Type: TABLE; Schema: mz_test; Owner: mz
--

CREATE TABLE mz_test.poptbl (
    pref_name character(12) NOT NULL,
    population integer,
    sex integer
);


ALTER TABLE mz_test.poptbl OWNER TO mz;

--
-- Name: sometable; Type: TABLE; Schema: mz_test; Owner: mz
--

CREATE TABLE mz_test.sometable (
    p_key character(1) NOT NULL,
    col_1 integer,
    col_2 character(2)
);


ALTER TABLE mz_test.sometable OWNER TO mz;

--
-- Data for Name: coursemaster; Type: TABLE DATA; Schema: mz_test; Owner: mz
--

COPY mz_test.coursemaster (course_id, course_name) FROM stdin;
1   会计入门
2   财务知识
3   薄记考试
4   税务师
\.


--
-- Data for Name: opencourses; Type: TABLE DATA; Schema: mz_test; Owner: mz
--

COPY mz_test.opencourses (courses_month, course_id) FROM stdin;
200706  1
200706  3
200706  4
200707  4
200708  2
200708  4
\.


--
-- Data for Name: poptbl; Type: TABLE DATA; Schema: mz_test; Owner: mz
--

COPY mz_test.poptbl (pref_name, population, sex) FROM stdin;
德岛    60  1
德岛    40  2
香川    100 1
香川    100 2
爱媛    100 1
爱媛    50  2
高知    100 1
高知    100 2
福冈    100 1
福冈    200 2
佐贺    20  1
佐贺    80  2
长崎    125 1
长崎    125 2
东京    250 1
东京    150 2
\.


--
-- Data for Name: sometable; Type: TABLE DATA; Schema: mz_test; Owner: mz
--

COPY mz_test.sometable (p_key, col_1, col_2) FROM stdin;
a    1  一
b    2  二
c    3  三
\.


--
-- Name: coursemaster coursemaster_pkey; Type: CONSTRAINT; Schema: mz_test; Owner: mz
--

ALTER TABLE ONLY mz_test.coursemaster
    ADD CONSTRAINT coursemaster_pkey PRIMARY KEY (course_id);


--
-- Name: sometable sometable_pkey; Type: CONSTRAINT; Schema: mz_test; Owner: mz
--

ALTER TABLE ONLY mz_test.sometable
    ADD CONSTRAINT sometable_pkey PRIMARY KEY (p_key);


--
-- Name: opencourses opencourses_course_id_fkey; Type: FK CONSTRAINT; Schema: mz_test; Owner: mz
--

ALTER TABLE ONLY mz_test.opencourses
    ADD CONSTRAINT opencourses_course_id_fkey FOREIGN KEY (course_id) REFERENCES mz_test.coursemaster(course_id);


--
-- PostgreSQL database dump complete
--
