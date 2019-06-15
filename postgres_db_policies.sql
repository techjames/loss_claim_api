--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8

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

--
-- Name: Policies; Type: DATABASE; Schema: -; Owner: postgres
--

ALTER DATABASE "Policies" OWNER TO postgres;

\connect "Policies"

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
-- Name: line_of_business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_of_business (
    id integer NOT NULL,
    name character varying(500) NOT NULL
);


ALTER TABLE public.line_of_business OWNER TO postgres;

--
-- Name: line_of_business_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.line_of_business_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_of_business_id_seq OWNER TO postgres;

--
-- Name: line_of_business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.line_of_business_id_seq OWNED BY public.line_of_business.id;


--
-- Name: policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy (
    id integer NOT NULL,
    description character varying(500),
    premium integer,
    line_of_business integer,
    claim_description character varying(500),
    incurred integer
);


ALTER TABLE public.policy OWNER TO postgres;

--
-- Name: policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policy_id_seq OWNER TO postgres;

--
-- Name: policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policy_id_seq OWNED BY public.policy.id;


--
-- Name: line_of_business id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_of_business ALTER COLUMN id SET DEFAULT nextval('public.line_of_business_id_seq'::regclass);


--
-- Name: policy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy ALTER COLUMN id SET DEFAULT nextval('public.policy_id_seq'::regclass);


--
-- Data for Name: line_of_business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.line_of_business (id, name) FROM stdin;
1	commercial
2	pi
3	motor
4	im
\.


--
-- Data for Name: policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy (id, description, premium, line_of_business, claim_description, incurred) FROM stdin;
1	warehouse	20000	1	fire	100000
2	warehouse	20000	1	fire	100000
3	warehouse	20000	1	theft	100000
4	warehouse	20000	1	spoilage	100000
5	warehouse	20000	1	fire	100000
6	warehouse	20000	1	fire	100000
7	warehouse	20000	1	theft	100000
8	warehouse	20000	1	spoilage	100000
9	warehouse	20000	1	workplace accident	2000000
10	warehouse	20000	1	fire	100000
11	warehouse	20000	1	theft	100000
12	warehouse	20000	1	spoilage	100000
13	warehouse	20000	1	fire	100000
14	restaurant	1000	1	slip	50000
15	restaurant	1000	1	food poisoning	50000
16	restaurant	1000	1	fire	50000
17	restaurant	1000	1	theft	50000
18	restaurant	1000	1	slip	50000
19	restaurant	1000	1	food poisoning	50000
20	restaurant	1000	1	fire	50000
21	restaurant	1000	1	theft	50000
22	restaurant	1000	1	slip	50000
23	restaurant	1000	1	food poisoning	50000
24	restaurant	1000	1	fire	50000
25	restaurant	1000	1	theft	50000
26	restaurant	1000	1	slip	50000
27	restaurant	1000	1	food poisoning	50000
28	restaurant	1000	1	fire	50000
29	restaurant	1000	1	theft	50000
30	solicitor	5000	2	malpractice	500000
31	solicitor	5000	2	malpractice	500000
32	solicitor	5000	2	\N	\N
33	solicitor	5000	2	\N	\N
34	solicitor	5000	2	\N	\N
35	solicitor	5000	2	\N	\N
36	solicitor	5000	2	\N	\N
37	solicitor	5000	2	\N	\N
38	solicitor	5000	2	\N	\N
39	solicitor	5000	2	\N	\N
40	solicitor	5000	2	\N	\N
41	solicitor	5000	2	\N	\N
42	solicitor	5000	2	\N	\N
43	solicitor	5000	2	\N	\N
44	solicitor	5000	2	malpractice	500000
45	solicitor	5000	2	malpractice	500000
46	solicitor	5000	2	malpractice	2000
47	solicitor	5000	2	malpractice	-1000
48	solicitor	\N	2	malpractice	100000
49	20 trucks	5000	3	accident	50000
50	21 trucks	5000	3	fire	1000000
51	22 trucks	5000	3	maintainence	50000
52	23 trucks	5000	3	accident	500000
53	24 trucks	5000	3	fire	10000
54	25 trucks	5000	3	maintainence	20000
55	26 trucks	5000	3	accident	50001
56	27 trucks	5000	3	\N	\N
57	28 trucks	5000	3	\N	\N
58	29 trucks	5000	3	\N	\N
59	30 trucks	5000	3	fire	10001
60	31 trucks	5000	3	maintainence	20001
61	32 trucks	5000	3	accident	50002
62	33 trucks	5000	3	fire	1000002
63	34 trucks	5000	3	maintainence	50002
64	35 trucks	20000	3	accident	500002
65	36 trucks	20000	3	fire	10002
66	37 trucks	20000	3	maintainence	20002
67	38 trucks	20000	3	accident	50003
68	39 trucks	20000	3	fire	1000003
69	oil platform	100000	4	maintainence	2000000
70	oil platform	100000	4	storm damage	50000000
71	oil platform	100000	4	fire	1500000
72	oil platform	100000	4	ship collision	500000
\.


--
-- Name: line_of_business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.line_of_business_id_seq', 4, true);


--
-- Name: policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policy_id_seq', 72, true);


--
-- Name: line_of_business line_of_business_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_of_business
    ADD CONSTRAINT line_of_business_name_key UNIQUE (name);


--
-- Name: line_of_business line_of_business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_of_business
    ADD CONSTRAINT line_of_business_pkey PRIMARY KEY (id);


--
-- Name: policy policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);


--
-- Name: policy policy_line_of_business_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_line_of_business_fkey FOREIGN KEY (line_of_business) REFERENCES public.line_of_business(id);


--
-- PostgreSQL database dump complete
--

