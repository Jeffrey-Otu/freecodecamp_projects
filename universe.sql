--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    is_spherical boolean
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
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    has_oxygen boolean,
    surface_temperature numeric
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
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    orbit_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    beyond_earth boolean NOT NULL,
    explored_beyond boolean,
    "position" numeric
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbit_orbit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbit_orbit_id_seq OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbit_orbit_id_seq OWNED BY public.orbit.orbit_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    distance_from_star integer,
    has_rings boolean NOT NULL,
    age_in_millions_of_years integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    luminosity numeric,
    is_burning boolean NOT NULL
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
-- Name: orbit orbit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit ALTER COLUMN orbit_id SET DEFAULT nextval('public.orbit_orbit_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A nearby galaxy', 2537000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 3000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Galaxy with a large central bulge', 28000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A spiral galaxy', 23000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical galaxy', 13000000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 1, true, false, -53);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, true, false, -40);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, true, false, -50);
INSERT INTO public.moon VALUES (24, 'Europa', 4, true, true, -160);
INSERT INTO public.moon VALUES (25, 'Titan', 5, true, false, -290);
INSERT INTO public.moon VALUES (26, 'Ganymede', 4, true, false, -160);
INSERT INTO public.moon VALUES (27, 'Callisto', 4, true, false, -130);
INSERT INTO public.moon VALUES (28, 'Io', 4, true, false, -143);
INSERT INTO public.moon VALUES (29, 'Enceladus', 5, true, true, -200);
INSERT INTO public.moon VALUES (30, 'Mimas', 5, true, false, -188);
INSERT INTO public.moon VALUES (31, 'Rhea', 5, true, false, -175);
INSERT INTO public.moon VALUES (32, 'Triton', 6, true, false, -235);
INSERT INTO public.moon VALUES (33, 'Ariel', 6, true, false, -190);
INSERT INTO public.moon VALUES (34, 'Umbriel', 6, true, false, -187);
INSERT INTO public.moon VALUES (35, 'Miranda', 6, true, false, -180);
INSERT INTO public.moon VALUES (36, 'Titania', 6, true, false, -170);
INSERT INTO public.moon VALUES (37, 'Oberon', 6, true, false, -160);
INSERT INTO public.moon VALUES (38, 'Charon', 7, true, false, -210);
INSERT INTO public.moon VALUES (39, 'Luna', 1, true, false, -53);
INSERT INTO public.moon VALUES (40, 'Conna', 4, true, false, -130);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbit VALUES (1, 'Low Earth Orbit', 1, false, true, 0.25);
INSERT INTO public.orbit VALUES (2, 'Mars Orbit', 4, true, true, 1.52);
INSERT INTO public.orbit VALUES (3, 'Jupiter Orbit', 5, true, false, 5.20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1496000, false, 4600);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2279000, false, 4600);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 1082000, false, 4600);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 7785000, true, 4600);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 14270000, true, 4600);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 28710000, true, 4600);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 44950000, true, 4600);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 5791000, false, 4600);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 2, 13700000, false, 200);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 3, 14000000, false, 200);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 7000000, false, 100);
INSERT INTO public.planet VALUES (12, 'Trappist-1d', 5, 11000000, false, 300);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 3.8, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 200, 25.4, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 6000, 1.5, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 100, 120000, true);
INSERT INTO public.star VALUES (5, 'Rigel', 4, 100, 120000, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4700, 0.001, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbit_orbit_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: orbit orbit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_name_key UNIQUE (name);


--
-- Name: orbit orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_pkey PRIMARY KEY (orbit_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: orbit orbit_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
