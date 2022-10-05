--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    light_years numeric,
    capital character varying(30),
    galaxy_id integer NOT NULL,
    current_leader character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    coords numeric,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    size numeric,
    habitable boolean,
    capital character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    habitable boolean NOT NULL,
    description text,
    capital character varying(30),
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    planet_id integer,
    name character varying(30) NOT NULL,
    solar_system_id integer NOT NULL,
    capital character varying(30)
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    coords numeric,
    lifestage character varying(30),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, NULL, NULL, 1, NULL);
INSERT INTO public.galaxy VALUES ('Hobokia', 2, NULL, NULL, 2, NULL);
INSERT INTO public.galaxy VALUES ('M', 2, NULL, NULL, 3, NULL);
INSERT INTO public.galaxy VALUES ('Milky Way', 3, NULL, NULL, 4, NULL);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', 2, NULL, NULL, 5, NULL);
INSERT INTO public.galaxy VALUES ('Draco', 2, NULL, NULL, 6, NULL);
INSERT INTO public.galaxy VALUES ('Draco II', 2, NULL, NULL, 7, NULL);
INSERT INTO public.galaxy VALUES ('Carina III', 2, NULL, NULL, 8, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Europa', NULL, 2, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 10, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 12, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 13, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 14, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 15, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 16, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 17, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 18, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 19, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 20, NULL, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', NULL, 2, 21, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', true, NULL, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Mars', false, NULL, NULL, 1, 2);
INSERT INTO public.planet VALUES ('Jupiter', false, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES ('Saturn', false, NULL, NULL, 1, 4);
INSERT INTO public.planet VALUES ('Pluto', false, NULL, NULL, 1, 5);
INSERT INTO public.planet VALUES ('Uranus', false, NULL, NULL, 1, 6);
INSERT INTO public.planet VALUES ('Neptune', false, NULL, NULL, 1, 7);
INSERT INTO public.planet VALUES ('X', true, NULL, NULL, 1, 8);
INSERT INTO public.planet VALUES ('Nibiru', true, NULL, NULL, 1, 9);
INSERT INTO public.planet VALUES ('Yoshiland', true, NULL, NULL, 2, 10);
INSERT INTO public.planet VALUES ('Kirbyland', true, NULL, NULL, 2, 11);
INSERT INTO public.planet VALUES ('Samusland', true, NULL, NULL, 3, 12);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (NULL, 'milky way', 1, NULL);
INSERT INTO public.solar_system VALUES (NULL, 'juicey way', 2, NULL);
INSERT INTO public.solar_system VALUES (NULL, 'smoothie way', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Lousun', NULL, NULL, 1, 1);
INSERT INTO public.star VALUES ('Suesun', NULL, NULL, 2, 2);
INSERT INTO public.star VALUES ('Hughsun', NULL, NULL, 3, 3);
INSERT INTO public.star VALUES ('Newsun', NULL, NULL, 4, 4);
INSERT INTO public.star VALUES ('Dewsun', NULL, NULL, 5, 5);
INSERT INTO public.star VALUES ('Yuwsun', NULL, NULL, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_capital_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_capital_key UNIQUE (capital);


--
-- Name: galaxy galaxy_current_leader_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_current_leader_key UNIQUE (current_leader);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_capital_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_capital_key UNIQUE (capital);


--
-- Name: moon moon_coords_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_coords_key UNIQUE (coords);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_capital_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_capital_key UNIQUE (capital);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_capital_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_capital_key UNIQUE (capital);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_coords_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_coords_key UNIQUE (coords);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: solar_system solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
