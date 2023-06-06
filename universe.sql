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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    apparent_magnitude_in_v numeric(4,1),
    distance_from_solar_system_mly numeric(4,2),
    constellation character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_classification; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_classification (
    galaxy_classification_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_classification OWNER TO freecodecamp;

--
-- Name: galaxy_classification_galaxy_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_classification_galaxy_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_classification_galaxy_classification_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_classification_galaxy_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_classification_galaxy_classification_id_seq OWNED BY public.galaxy_classification.galaxy_classification_id;


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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_classification_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass character varying(20),
    is_spherical boolean NOT NULL,
    order_to_planet integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying(30),
    is_dwarf boolean NOT NULL,
    how_many_moon integer,
    mass numeric(8,5) NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(30),
    system character varying(30),
    mass_in_solarmass numeric(4,1) NOT NULL
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
-- Name: galaxy_classification galaxy_classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_classification ALTER COLUMN galaxy_classification_id SET DEFAULT nextval('public.galaxy_classification_galaxy_classification_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 0.03, 'Sagittarius', 'The Milky Way is a barred spiral galaxy that serves as the home of our Solar System. It is a vast, disk-shaped structure consisting of billions of stars, along with various celestial objects such as planets, asteroids, comets, and interstellar gas and dust. The galaxy stretches across approximately 100,000 light-years and contains an estimated 200 to 400 billion stars. The Milky Way is characterized by its spiral arms, which emanate from a central bar-shaped structure, and it rotates slowly around its core. Earth resides in one of the spiral arms, known as the Orion Arm or Local Spur, about 27,000 light-years from the galactic center');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 3.4, 2.50, 'Andromeda', 'The Andromeda Galaxy, also known as Messier 31 or M31, is a majestic spiral galaxy located approximately 2.537 million light-years away from Earth. It is the closest spiral galaxy to our own Milky Way and is a member of the Local Group of galaxies, which also includes our galaxy and several other smaller galaxies.
Andromeda spans about 220,000 light-years in diameter, making it slightly larger than the Milky Way. It contains billions of stars, along with various celestial objects such as nebulae, star clusters, and dust.
One of the most striking features of the Andromeda Galaxy is its spiral structure, with arms spiraling out from a central nucleus. These spiral arms are regions of active star formation, where new stars are constantly being born.
Andromeda and the Milky Way are on a collision course and are expected to merge in about 4 billion years, forming a new galaxy called Milkomeda. This event will have a significant impact on the structure and evolution of both galaxies.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 8.0, 31.10, 'Virgo', 'The Sombrero Galaxy, also known as Messier 104 or M104, is a stunning spiral galaxy located approximately 28 million light-years away from Earth in the constellation Virgo. It gets its name from its distinct shape, resembling a wide-brimmed Mexican hat or sombrero.
The Sombrero Galaxy stands out with its prominent bulge in the center and a broad, flattened disk that is encircled by a dark lane of dust. This dark dust lane, along with its bright nucleus, gives the galaxy its distinctive appearance.
Spanning about 50,000 light-years in diameter, the Sombrero Galaxy is slightly smaller than our Milky Way.
The galaxy also exhibits active star formation in its outer regions, where new stars are still being born. Additionally, it hosts a supermassive black hole at its core, which has a mass equivalent to about one billion suns.
The Sombrero Galaxy is a favorite target for amateur and professional astronomers alike due to its striking appearance and intriguing features. Its study provides valuable insights into the formation and evolution of spiral galaxies in the universe.');
INSERT INTO public.galaxy VALUES (4, 'NGC 4151', 11.5, 51.50, 'Canus Venatici', 'NGC 4151 is an intermediate spiral Seyfert galaxy with weak inner ring structure located 15.8 megaparsecs (52 million light-years) from Earth in the constellation Canes Venatici. The galaxy was first mentioned by William Herschel on March 17, 1787; it was one of the six Seyfert galaxies described in the paper which defined the term. It is one of the nearest galaxies to Earth to contain an actively growing supermassive black hole. The black hole would have a mass on the order of 2.5 million to 30 million solar masses.');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 8.5, 17.30, 'Coma Berenices', 'The Black Eye Galaxy, also known as Messier 64 or M64, is a fascinating spiral galaxy located approximately 24 million light-years away from Earth in the constellation Coma Berenices. It is famous for its unique and captivating feature, a dark band of obscuring dust that appears to create a "black eye" effect in its central region.
The Black Eye Galaxy has a distinct appearance, with a bright central bulge surrounded by a dark dust lane that wraps around its nucleus. This dark lane is believed to be caused by an interstellar dust cloud that obscures light and creates a stark contrast against the bright stars and glowing gas in the galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 5.7, 3.00, 'Triangulum', 'The Triangulum Galaxy, also known as Messier 33 or M33, is a spiral galaxy located in the constellation Triangulum. It is the third-largest galaxy in the Local Group (a group of galaxies that includes the Milky Way), and it exhibits ongoing star formation in its spiral arms.');


--
-- Data for Name: galaxy_classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_classification VALUES (1, 'Spiral Galaxy', 'Spiral galaxies are surrounded by halos, mixtures of old stars, star clusters, and dark matter – invisible material that does not emit or reflect light but still has a gravitational pull on other matter. The youngest stars form in gas-rich arms, while older stars can be found throughout the disk and within the bulge and halo.');
INSERT INTO public.galaxy_classification VALUES (2, 'Elliptical Galaxy', 'Elliptical galaxies have shapes that range from completely round to oval. They are less common than spiral galaxies.
Unlike spirals, elliptical galaxies usually contain little gas and dust and show very little organization or structure. The stars orbit around the core in random directions and are generally older than those in spiral galaxies since little of the gas needed to form new stars remains. Scientists think elliptical galaxies originate from collisions and mergers with spirals.');
INSERT INTO public.galaxy_classification VALUES (3, 'Lenticular Galaxy', 'Lenticular galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.
Scientists have a few theories about how lenticular galaxies evolved. One idea suggests these galaxies are older spirals whose arms have faded. Another proposes that lenticulars formed from mergers of spiral galaxies.');
INSERT INTO public.galaxy_classification VALUES (4, 'Irregular Galaxies', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun’s mass to large ones weighing 10 billion solar masses.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 1, 1, NULL);
INSERT INTO public.galaxy_type VALUES (2, 2, 1, NULL);
INSERT INTO public.galaxy_type VALUES (3, 3, 3, NULL);
INSERT INTO public.galaxy_type VALUES (4, 4, 1, NULL);
INSERT INTO public.galaxy_type VALUES (5, 5, 1, NULL);
INSERT INTO public.galaxy_type VALUES (6, 6, 1, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', '0.0123', true, 1);
INSERT INTO public.moon VALUES (2, 9, 'Phobos', '1.08e-8', false, 1);
INSERT INTO public.moon VALUES (3, 9, 'Deimon', '2.4e-9', false, 2);
INSERT INTO public.moon VALUES (4, 4, 'Io', '0.015', true, 1);
INSERT INTO public.moon VALUES (5, 4, 'Europa', '0.008', true, 2);
INSERT INTO public.moon VALUES (6, 4, 'Ganymede', '0.025', true, 3);
INSERT INTO public.moon VALUES (7, 4, 'Callisto', '0.018', true, 4);
INSERT INTO public.moon VALUES (8, 5, 'Mimas', '3.75e-5', true, 1);
INSERT INTO public.moon VALUES (9, 5, 'Enceladus', '8.4e-5', true, 2);
INSERT INTO public.moon VALUES (10, 5, 'Tethys', '0.00062', true, 3);
INSERT INTO public.moon VALUES (11, 5, 'Dione', '0.0011', true, 4);
INSERT INTO public.moon VALUES (12, 5, 'Rhea', '0.00059', true, 5);
INSERT INTO public.moon VALUES (13, 5, 'Titan', '0.0225', true, 6);
INSERT INTO public.moon VALUES (14, 5, 'Iapetus', '0.00075', true, 7);
INSERT INTO public.moon VALUES (15, 6, 'Miranda', '0.000006', true, 1);
INSERT INTO public.moon VALUES (16, 6, 'Ariel', '0.00031', true, 2);
INSERT INTO public.moon VALUES (17, 6, 'Umbriel', '0.00037', true, 3);
INSERT INTO public.moon VALUES (18, 6, 'Titania', '0.00053', true, 4);
INSERT INTO public.moon VALUES (19, 6, 'Oberon', '0.00048', true, 5);
INSERT INTO public.moon VALUES (20, 7, 'Triton', '0.0035', true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, 0, 0.55000);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, 0, 0.81500);
INSERT INTO public.planet VALUES (3, 1, 'Earth', false, 1, 1.00000);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', false, 79, 317.80000);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', false, 82, 95.20000);
INSERT INTO public.planet VALUES (6, 1, 'Uranus', false, 27, 14.50000);
INSERT INTO public.planet VALUES (7, 1, 'Neptune', false, 14, 17.10000);
INSERT INTO public.planet VALUES (8, 1, 'Pluto', true, 5, 0.00200);
INSERT INTO public.planet VALUES (9, 1, 'Mars', false, 14, 0.10700);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri B', false, NULL, 1.17000);
INSERT INTO public.planet VALUES (11, 3, 'Osiris', false, NULL, 218.73000);
INSERT INTO public.planet VALUES (12, 5, 'Kepler-453b', false, NULL, 5.00000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Solar System', 1.0);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'Alpha Centauri', 1.1);
INSERT INTO public.star VALUES (3, 1, 'Kepler-452', 'Constellation Cygnus', 1.0);
INSERT INTO public.star VALUES (4, 1, 'Achird', 'Eta Cassiopeiae', 1.0);
INSERT INTO public.star VALUES (5, 1, 'Osiris', 'HD 209458', 1.1);
INSERT INTO public.star VALUES (6, 2, 'Phi Andromedae', NULL, 6.5);


--
-- Name: galaxy_classification_galaxy_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_classification_galaxy_classification_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_classification galaxy_classification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_classification
    ADD CONSTRAINT galaxy_classification_name_key UNIQUE (name);


--
-- Name: galaxy_classification galaxy_classification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_classification
    ADD CONSTRAINT galaxy_classification_pkey PRIMARY KEY (galaxy_classification_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy_type galaxy_type_galaxy_classification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_classification_id_fkey FOREIGN KEY (galaxy_classification_id) REFERENCES public.galaxy_classification(galaxy_classification_id);


--
-- Name: galaxy_type galaxy_type_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
