--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    diameter_in_ly numeric,
    distance_in_ly numeric,
    type text NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer,
    orbital_period_days numeric(5,2),
    is_geologically_active boolean
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30),
    orbital_period_days integer,
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_atmospheres; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_atmospheres (
    planet_atmospheres_id integer NOT NULL,
    name character varying(50) NOT NULL,
    atmosphere_type character varying(60),
    atmospheric_pressure_pa integer
);


ALTER TABLE public.planet_atmospheres OWNER TO freecodecamp;

--
-- Name: planet_atmospheres_planet_atmospheres_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_atmospheres_planet_atmospheres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_atmospheres_planet_atmospheres_id_seq OWNER TO freecodecamp;

--
-- Name: planet_atmospheres_planet_atmospheres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_atmospheres_planet_atmospheres_id_seq OWNED BY public.planet_atmospheres.planet_atmospheres_id;


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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    notes text
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
-- Name: planet_atmospheres planet_atmospheres_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_atmospheres ALTER COLUMN planet_atmospheres_id SET DEFAULT nextval('public.planet_atmospheres_planet_atmospheres_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, diameter_in_ly, distance_in_ly, type) FROM stdin;
1       Milky Way       100.000 0       Barred Spiral
2       LMC     14.000  158.000 Dwarf Irregular
3       Andromeda       220.000 2500000.5       Spiral
4       Cigar Galaxy    37.000  11500000.0      Starburst Irregular
5       Pinwheel Galaxy 170.000 20870000.0      Spiral
6       Hoags Object    100.000 600000000.0     Ring Galaxy
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, orbital_period_days, is_geologically_active) FROM stdin;
1       Moon    3       27.32   f
2       Phobos  4       0.32    f
3       Deimos  4       1.26    f
4       Io      5       1.77    t
5       Europa  5       3.55    t
6       Ganymede        5       7.15    t
7       Callisto        5       16.69   f
8       Amalthea        5       0.50    f
9       Titan   6       15.95   t
10      Enceladus       6       1.37    t
11      Rhea    6       4.52    f
12      Lapetus 6       79.33   f
13      Dione   6       2.74    f
14      Tethys  6       1.89    f
15      Miranda 7       1.41    t
16      Ariel   7       2.52    t
17      Umbriel 7       4.14    f
18      Titania 7       8.71    f
19      Triton  8       5.88    t
20      Charon  9       6.39    f
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, star_id, planet_type, orbital_period_days, has_atmosphere) FROM stdin;
1       Mercury 1       Terrestrial     88      f
2       Venus   1       Terrestrial     225     t
3       Earth   1       Terrestrial     365     t
4       Mars    1       Terrestrial     687     t
5       Jupiter 1       Gas Giant       4333    t
7       Uranus  1       Ice Giant       60182   t
8       Neptune 1       Ice Giant       60182   t
9       Pluto   1       Dwarf Planet    90560   t
10      Eris    1       Dwarf Planet    203830  f
11      Haumea  1       Dwarf Planet    103774  f
12      Makemake        1       Dwarf Planet    112897  f
6       Saturn  1       Gas Giant       10759   t
\.


--
-- Data for Name: planet_atmospheres; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet_atmospheres (planet_atmospheres_id, name, atmosphere_type, atmospheric_pressure_pa) FROM stdin;
1       Earth   Nitrogen-Oxygen 101325
2       Venus   Carbon Dioxide (Dense)  9200000
3       Mars    Carbon Dioxide (Thin)   610
4       Jupiter Hydrogen-Helium 200000
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, galaxy_id, type, notes) FROM stdin;
1       Sun     1       G-Type Main Sequence Star       Star at the center of the Solar System
2       Sirius  1       Main Sequence Star      Brightest Star in Earths night sky
3       Betelgeuse      1       Red Supergiant  Variable star, possible future supernova
4       R136a1  2       Wolf-Rayet/ Hypergiant  One of the most massive stars ever discovered
5       V1      3       Cepheid Variable        Often called the "most important star in the history of cosmology"
6       SN 2023ixf      5       Red Supergiant  Closest and brightest supernova seen in Earths skies in over a decade
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_atmospheres_planet_atmospheres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_atmospheres_planet_atmospheres_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: moon dois_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT dois_unique UNIQUE (moon_id, name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_atmospheres planet_atmospheres_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_atmospheres
    ADD CONSTRAINT planet_atmospheres_pkey PRIMARY KEY (planet_atmospheres_id);


--
-- Name: planet_atmospheres planet_atmospheres_planet_atmospheres_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_atmospheres
    ADD CONSTRAINT planet_atmospheres_planet_atmospheres_id_name_key UNIQUE (planet_atmospheres_id, name);


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
-- Name: galaxy toda_tabela_2unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT toda_tabela_2unique UNIQUE (galaxy_id, name);


--
-- Name: planet toda_tabela_tem_que_ter_2colunas_com_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT toda_tabela_tem_que_ter_2colunas_com_unique UNIQUE (planet_id, name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
