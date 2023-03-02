--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    user_token character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id integer NOT NULL,
    user_id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(225) NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(60) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, '86df8a3b-c691-4422-9e00-d9d86739e4b1', '2023-03-01 23:54:09.514512');
INSERT INTO public.sessions VALUES (2, 1, 'bfa7ae74-407e-44c5-87fe-e87f17f290b5', '2023-03-01 23:55:20.512511');
INSERT INTO public.sessions VALUES (3, 3, '15fcf308-7d9d-4174-93c9-dfaabd1f4f35', '2023-03-01 23:57:10.43072');


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.url VALUES (2, 2, 'https://www.globo.com', 'c9CrbKj', 4, '2023-03-01 23:54:42.521926');
INSERT INTO public.url VALUES (3, 2, 'https://www.youtube.com', 'RS9qDmB', 2, '2023-03-01 23:55:02.949278');
INSERT INTO public.url VALUES (4, 1, 'https://www.twitter.com', '52f8_qR', 6, '2023-03-01 23:55:50.325753');
INSERT INTO public.url VALUES (5, 1, 'https://www.instagram.com', '70-v1x3', 11, '2023-03-01 23:55:59.405256');
INSERT INTO public.url VALUES (6, 1, 'https://www.instagram.com/theoffice/', 'RFe4JLG', 3, '2023-03-01 23:56:53.230331');
INSERT INTO public.url VALUES (7, 3, 'https://www.instagram.com/p/CopoO6AOFUQ/', 'odkrjf2', 17, '2023-03-01 23:57:43.729605');
INSERT INTO public.url VALUES (8, 3, 'https://www.instagram.com/p/Cl9st9nuHRY/', '-mKJ3B_', 1, '2023-03-01 23:58:18.294024');
INSERT INTO public.url VALUES (9, 3, 'https://www.instagram.com/p/Ch5ClHlBEgg/', '1NTSydR', 5, '2023-03-01 23:58:58.297538');
INSERT INTO public.url VALUES (1, 2, 'https://www.github.com', 'nH9ET7X', 4, '2023-03-01 23:54:30.478142');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Dwight Schrute', 'dwight@email.com', '$2b$10$XvvR8.AiO12G6xqwIBOkzuij.pt1yWjHKdiFBqQiq4FESL8BFwi8C', '2023-03-01 23:51:14.648628');
INSERT INTO public.users VALUES (2, 'Jim Halpert', 'jim@email.com', '$2b$10$8FnE4iawtraCGVKuN1eNJezBr.FhPMBwNZAK4/OfPqDRZUzGFBVny', '2023-03-01 23:51:53.714852');
INSERT INTO public.users VALUES (3, 'Michael Scott', 'michael@email.com', '$2b$10$eVLYOivG6pjyECtz7b.VceJpH4o831N5m4VpXQ1OkBoIkuCrAyPMa', '2023-03-01 23:52:25.460921');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_token_key UNIQUE (user_token);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: url url_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

