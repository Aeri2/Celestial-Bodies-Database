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
    name character varying(30) NOT NULL,
    number_of_stars integer NOT NULL,
    diameter integer,
    mass numeric,
    description text,
    has_supermassive_blackhole boolean
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
    mass numeric NOT NULL,
    description text,
    has_ice boolean,
    planet_id integer,
    moon_radius integer,
    distance_from_planet integer
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
    distance_from_sun integer NOT NULL,
    planet_radius integer,
    mass numeric,
    description text,
    has_rings boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    star_radius integer NOT NULL,
    number_of_planets integer,
    mass numeric,
    description text,
    has_planets boolean,
    galaxy_id integer
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
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    discovered_date date
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_system_id_seq OWNED BY public.star_system.star_system_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'bimasakti', 1000, 30000, 9000000, 'galaksi terdekat', false),
    (2, 'Milky Way', 10000000, 1000, 1.0e12, 'The Milky Way is the galaxy that contains our Solar System. It is a barred spiral galaxy with a supermassive black hole at its center.', TRUE),
    (3, 'Andromeda', 100000, 220000, 1.5e12, 'The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way and is on a collision course with it.', TRUE),
    (4, 'Messier 33', 40000000, 60000, 4.2e11, 'Messier 33, also known as the Triangulum Galaxy, is a spiral galaxy in the constellation Triangulum and is one of the closest galaxies to the Milky Way.', FALSE),
	(5, 'Small Magellanic Cloud', 50000, 7000, 7.5e10, 'The Small Magellanic Cloud is another irregular galaxy and a satellite of the Milky Way. It is located near the Large Magellanic Cloud.', FALSE),
    (6, 'Pinwheel Galaxy', 5000000, 170000, 9.0e11, 'The Pinwheel Galaxy is a face-on spiral galaxy in the constellation Ursa Major. It is known for its prominent spiral structure.', FALSE),
    (7, 'Sombrero Galaxy', 700000, 50000, 1.2e12, 'The Sombrero Galaxy is a spiral galaxy in the constellation Virgo. It is recognized for its bright nucleus and large dust lane.', TRUE),
    (8, 'Centaurus A', 40000000, 60000, 1.1e12, 'Centaurus A is a giant elliptical galaxy with a prominent dust lane and is one of the closest active galaxies to Earth.', TRUE);
	



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'bulan', 200, 'Bulan dekat bumi', false, 1, 250, 300),
    (2, 'Ganymede', 1.48e23, 'Ganymede is the largest moon in the Solar System, orbiting Jupiter. It has its own magnetic field and is believed to have an internal ocean.', TRUE, 1, 2634, 1070000),
    (3, 'Titan', 1.35e23, 'Titan is Saturns largest moon and the second-largest in the Solar System. It has a dense atmosphere and liquid methane lakes on its surface.', TRUE, 2, 2575, 1222000),
    (4, 'Europa', 4.8e22, 'Europa is one of Jupiter moons and is known for its smooth ice-covered surface, with possible subsurface oceans beneath.', TRUE, 3, 1560, 671000),
	(5, 'Luna', 7.35e22, 'Moon of Earth with significant tidal effects.', TRUE, 3, 1737.4, 384400),
	(6, 'Europas', 4.8e22, 'Icy moon of Jupiter with a subsurface ocean.', TRUE, 5, 1560.8, 671100),
	(7, 'Ganymedesa', 1.48e23, 'Largest moon in the Solar System, orbiting Jupiter.', TRUE, 5, 2634.1, 1070400),
	(8, 'Callisto', 1.08e23, 'Second largest moon of Jupiter, heavily cratered.', FALSE, 5, 2400.0, 1882700),
	(9, 'Titans', 1.35e23, 'Largest moon of Saturn with a thick atmosphere.', TRUE, 6, 2575.0, 1221900),
	(10, 'Rhea', 2.31e21, 'Second largest moon of Saturn with a thin atmosphere.', FALSE, 6, 764.0, 527040),
	(11, 'Iapetus', 4.03e21, 'Moon of Saturn known for its two-tone coloration.', FALSE, 6, 735.0, 3561300),
	(12, 'Enceladus', 1.08e20, 'Saturn’s moon with geysers spewing ice particles.', TRUE, 6, 252.1, 238020),
	(13, 'Miranda', 6.59e19, 'Moon of Uranus with extreme topography.', FALSE, 7, 235.8, 129390),
	(14, 'Titania', 3.52e21, 'Largest moon of Uranus with a large canyon system.', FALSE, 7, 788.0, 436300),
	(15, 'Oberon', 3.07e21, 'Moon of Uranus with a heavily cratered surface.', FALSE, 7, 761.4, 583520),
	(16, 'Umbriel', 1.17e21, 'Moon of Uranus with a dark, cratered surface.', FALSE, 7, 584.7, 265970),
	(17, 'Triton', 2.14e22, 'Largest moon of Neptune with geysers and retrograde orbit.', TRUE, 8, 1353.0, 354760),
	(18, 'Nereid', 1.8e21, 'Moon of Neptune with an elongated orbit.', FALSE, 8, 170.0, 5513000),
	(19, 'Charon', 1.52e21, 'Largest moon of Pluto, almost half its diameter.', TRUE, 9, 606.0, 19500),
	(20, 'Hydra', 4.2e18, 'Small moon of Pluto, discovered in 2005.', FALSE, 9, 30.0, 65000),
	(21, 'Nix', 4.2e18, 'Small moon of Pluto, discovered in 2005.', FALSE, 9, 42.0, 48800),
	(22, 'Kerberos', 1.1e18, 'Small moon of Pluto, discovered in 2011.', FALSE, 9, 19.0, 19700),
	(23, 'Styx', 3.8e18, 'Small moon of Pluto, discovered in 2012.', FALSE, 9, 10.0, 42000),
	(24, 'Phobos', 1.08e16, 'Small, irregularly shaped moon of Mars with a rapid orbit.', FALSE, 4, 11.1, 9377),
	(25, 'Deimos', 1.48e16, 'Small, irregularly shaped moon of Mars with a slower orbit.', FALSE, 4, 6.2, 23460);




--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 300, 500, 600, 'Planet berpenghuni', false, 1),
	(2, 'Saturn', 14290000, 58232, 568e26, 'Saturn is the sixth planet from the Sun, known for its prominent ring system. It is a gas giant with numerous moons.', TRUE, 1),
    (3, 'Mars', 2279000, 33895, 642e23, 'Mars is the fourth planet from the Sun, often called the Red Planet due to its reddish appearance. It has the largest volcano and canyon in the Solar System.', FALSE, 1),
    (4, 'Jupiter', 7785000, 69911, 190e27, 'Jupiter is the largest planet in the Solar System and the fifth from the Sun. It is known for its Great Red Spot and strong magnetic field.', TRUE, 1),
	(5, 'Uranus', 28710000, 253620, 868e25, 'An ice giant with a unique tilt on its axis and faint ring system.', TRUE, 1),
	(6, 'Neptune', 4495000, 246220, 102e26, 'The farthest known planet from the Sun, known for its deep blue color and strong winds.', TRUE, 1),
	(7, 'Pluto', 5913000, 11883, 130e22, 'Dwarf planet in the Kuiper Belt, known for its complex atmosphere and icy surface.', FALSE, 1),
	(8, 'Kepler-22b', 600000, 54000, 24e25, 'Exoplanet in the habitable zone of the star Kepler-22.', FALSE, 2),
	(9, 'HD 209458 b', 1550000, 62000, 14e25, 'A hot Jupiter exoplanet orbiting the star HD 209458.', TRUE, 2),
	(10, 'Proxima Centauri b', 7600000, 70000, 1.17e24, 'Exoplanet in the habitable zone of the red dwarf Proxima Centauri.', FALSE, 3),
	(11, 'Tau Ceti e', 1130000, 63000, 12e25, 'Potentially habitable exoplanet orbiting Tau Ceti.', FALSE, 3),
	(12, '55 Cancri e', 1140000, 56000, 80e24, 'A super-Earth exoplanet orbiting the star 55 Cancri.', FALSE, 4),
	(13, 'HD 189733 b', 1120000, 70000, 32e25, 'A hot Jupiter exoplanet with a turbulent atmosphere.', TRUE, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 696340, 8, 1.989e30, 'The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, radiating energy that supports life on Earth.', TRUE, 1),
    (2, 'Sirius', 1711000, 2, 4.18e30, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system composed of Sirius A and Sirius B.', TRUE, 2),
    (3, 'Alpha Centauri', 1219000, 3, 2.19e30, 'Alpha Centauri is the closest star system to the Solar System, located in the constellation Centaurus. It is a triple star system consisting of Alpha Centauri A, B, and Proxima Centauri.', TRUE, 3),
    (4, 'Betelgeuse', 1180000000, 1, 1.6e30, 'Betelgeuse is a red supergiant star in the constellation Orion. It is one of the largest stars visible to the naked eye and is nearing the end of its stellar life.', FALSE, 4),
	(5, 'Rigel', 1180000, 0, 3.00e31, 'A blue supergiant star in the constellation Orion, one of the most luminous stars known.', FALSE, 1),
	(6, 'Arcturus', 860000, 5, 1.20e30, 'A red giant star in the constellation Boötes, known for its brightness and relative proximity to Earth.', TRUE, 1),
	(7, 'Vega', 491000, 1, 2.10e30, 'A blue-white main-sequence star in the constellation Lyra, known for its brightness and use as a reference star.', TRUE, 1),
	(8, 'Altair', 1240000, 0, 1.80e30, 'A bright star in the constellation Aquila, known for its rapid rotation and high luminosity.', FALSE, 1);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES
    (1, 'Solar System', 'The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, including planets, moons, asteroids, and comets. It is the system in which Earth resides.', '1836-10-04'),
    (2, 'Alpha Centauri System', 'The Alpha Centauri System is the closest star system to the Solar System, consisting of three stars: Alpha Centauri A, Alpha Centauri B, and Proxima Centauri.', '1836-10-04'),
    (3, 'Sirius System', 'The Sirius System is a binary star system in the constellation Canis Major, containing the bright star Sirius A and its white dwarf companion Sirius B.', '1862-01-31'),
    (4, 'Beta Pictoris System', 'The Beta Pictoris System is a young star system with a notable debris disk and an exoplanet orbiting Beta Pictoris, which is located in the constellation Pictor.', '1984-12-07');

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: star_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_system_id_seq', 1, false);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


--
-- Name: star_system star_system_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_unique_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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
--

