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
-- Name: poptbl; Type: TABLE; Schema: public; Owner: mz
--

CREATE TABLE public.poptbl (
    pref_name character(12) NOT NULL,
    population integer,
    sex integer
);


ALTER TABLE public.poptbl OWNER TO mz;

--
-- Name: sometable; Type: TABLE; Schema: public; Owner: mz
--

CREATE TABLE public.sometable (
    p_key character(1) NOT NULL,
    col_1 integer,
    col_2 character(2)
);


ALTER TABLE public.sometable OWNER TO mz;

--
-- Data for Name: poptbl; Type: TABLE DATA; Schema: public; Owner: mz
--

COPY public.poptbl (pref_name, population, sex) FROM stdin;
德岛            60      1
德岛            40      2
香川            100     1
香川            100     2
爱媛            100     1
爱媛            50      2
高知            100     1
高知            100     2
福冈            100     1
福冈            200     2
佐贺            20      1
佐贺            80      2
长崎            125     1
长崎            125     2
东京            250     1
东京            150     2
\.


--
-- Data for Name: sometable; Type: TABLE DATA; Schema: public; Owner: mz
--

COPY public.sometable (p_key, col_1, col_2) FROM stdin;
\.


--
-- Name: sometable sometable_pkey; Type: CONSTRAINT; Schema: public; Owner: mz
--

ALTER TABLE ONLY public.sometable
    ADD CONSTRAINT sometable_pkey PRIMARY KEY (p_key);


--
-- PostgreSQL database dump complete
--
