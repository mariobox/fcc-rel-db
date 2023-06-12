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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    games_played integer,
    best_game integer,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (92, 5, 304, 'user_1686594998247');
INSERT INTO public.users VALUES (71, 2, 535, 'user_1686593740920');
INSERT INTO public.users VALUES (70, 5, 40, 'user_1686593740921');
INSERT INTO public.users VALUES (72, 1, 13, 'George');
INSERT INTO public.users VALUES (84, 2, 522, 'user_1686594247482');
INSERT INTO public.users VALUES (83, 5, 23, 'user_1686594247483');
INSERT INTO public.users VALUES (74, 2, 241, 'user_1686593885243');
INSERT INTO public.users VALUES (85, 1, 7, 'jose');
INSERT INTO public.users VALUES (73, 5, 548, 'user_1686593885244');
INSERT INTO public.users VALUES (95, 2, 65, 'user_1686595010017');
INSERT INTO public.users VALUES (94, 5, 20, 'user_1686595010018');
INSERT INTO public.users VALUES (76, 2, 423, 'user_1686594072411');
INSERT INTO public.users VALUES (87, 2, 23, 'user_1686594570530');
INSERT INTO public.users VALUES (107, 2, 246, 'user_1686595063934');
INSERT INTO public.users VALUES (75, 5, 307, 'user_1686594072412');
INSERT INTO public.users VALUES (86, 5, 127, 'user_1686594570531');
INSERT INTO public.users VALUES (106, 5, 50, 'user_1686595063935');
INSERT INTO public.users VALUES (78, 2, 477, 'user_1686594080545');
INSERT INTO public.users VALUES (97, 2, 448, 'user_1686595023786');
INSERT INTO public.users VALUES (119, 2, 259, 'user_1686595570065');
INSERT INTO public.users VALUES (77, 5, 189, 'user_1686594080546');
INSERT INTO public.users VALUES (96, 5, 119, 'user_1686595023787');
INSERT INTO public.users VALUES (89, 2, 131, 'user_1686594916944');
INSERT INTO public.users VALUES (69, 2, 37, 'user_1686593383370');
INSERT INTO public.users VALUES (80, 2, 344, 'user_1686594085642');
INSERT INTO public.users VALUES (68, 5, 186, 'user_1686593383371');
INSERT INTO public.users VALUES (88, 5, 100, 'user_1686594916945');
INSERT INTO public.users VALUES (79, 5, 99, 'user_1686594085643');
INSERT INTO public.users VALUES (118, 5, 20, 'user_1686595570066');
INSERT INTO public.users VALUES (99, 2, 162, 'user_1686595030255');
INSERT INTO public.users VALUES (91, 2, 343, 'user_1686594985681');
INSERT INTO public.users VALUES (82, 2, 682, 'user_1686594091871');
INSERT INTO public.users VALUES (109, 2, 489, 'user_1686595071077');
INSERT INTO public.users VALUES (98, 5, 110, 'user_1686595030256');
INSERT INTO public.users VALUES (81, 5, 101, 'user_1686594091872');
INSERT INTO public.users VALUES (90, 5, 98, 'user_1686594985682');
INSERT INTO public.users VALUES (108, 5, 335, 'user_1686595071078');
INSERT INTO public.users VALUES (93, 2, 411, 'user_1686594998246');
INSERT INTO public.users VALUES (101, 2, 317, 'user_1686595037793');
INSERT INTO public.users VALUES (100, 5, 259, 'user_1686595037794');
INSERT INTO public.users VALUES (121, 2, 20, 'user_1686595579861');
INSERT INTO public.users VALUES (111, 2, 796, 'user_1686595077396');
INSERT INTO public.users VALUES (120, 5, 558, 'user_1686595579862');
INSERT INTO public.users VALUES (103, 2, 80, 'user_1686595045829');
INSERT INTO public.users VALUES (67, 4, 5, 'Mario');
INSERT INTO public.users VALUES (110, 5, 173, 'user_1686595077397');
INSERT INTO public.users VALUES (102, 5, 8, 'user_1686595045830');
INSERT INTO public.users VALUES (113, 2, 132, 'user_1686595504210');
INSERT INTO public.users VALUES (105, 2, 480, 'user_1686595057530');
INSERT INTO public.users VALUES (123, 2, 243, 'user_1686596091532');
INSERT INTO public.users VALUES (112, 5, 310, 'user_1686595504211');
INSERT INTO public.users VALUES (104, 5, 475, 'user_1686595057531');
INSERT INTO public.users VALUES (122, 5, 125, 'user_1686596091533');
INSERT INTO public.users VALUES (115, 2, 646, 'user_1686595511530');
INSERT INTO public.users VALUES (125, 2, 294, 'user_1686596122728');
INSERT INTO public.users VALUES (114, 5, 384, 'user_1686595511531');
INSERT INTO public.users VALUES (124, 5, 262, 'user_1686596122729');
INSERT INTO public.users VALUES (117, 2, 515, 'user_1686595521046');
INSERT INTO public.users VALUES (116, 5, 556, 'user_1686595521047');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 125, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

