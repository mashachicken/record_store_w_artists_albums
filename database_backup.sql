--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.albums (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.albums OWNER TO "Guest";

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO "Guest";

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: sold_albums; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.sold_albums (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.sold_albums OWNER TO "Guest";

--
-- Name: sold_albums_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.sold_albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sold_albums_id_seq OWNER TO "Guest";

--
-- Name: sold_albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.sold_albums_id_seq OWNED BY public.sold_albums.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.songs (
    name character varying,
    id integer NOT NULL,
    album_id integer
);


ALTER TABLE public.songs OWNER TO "Guest";

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO "Guest";

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: sold_albums id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.sold_albums ALTER COLUMN id SET DEFAULT nextval('public.sold_albums_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.albums (name, id) FROM stdin;
\.


--
-- Data for Name: sold_albums; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.sold_albums (name, id) FROM stdin;
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.songs (name, id, album_id) FROM stdin;
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.albums_id_seq', 1, false);


--
-- Name: sold_albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.sold_albums_id_seq', 1, false);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.songs_id_seq', 1, false);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: sold_albums sold_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.sold_albums
    ADD CONSTRAINT sold_albums_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

