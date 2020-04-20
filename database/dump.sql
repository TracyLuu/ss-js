--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	1	2	2595
2	1	3	2900
3	1	1	2999
4	1	5	9900
5	1	5	9900
6	2	3	2900
7	2	1	2999
8	3	1	2999
9	4	6	830
10	4	6	830
11	4	6	830
12	4	6	830
13	4	6	830
14	5	2	2595
15	5	3	2900
16	6	2	2595
17	6	3	2900
18	6	2	2595
19	6	3	2900
20	6	4	999
21	7	1	2999
22	7	5	9900
23	8	3	2900
24	8	1	2999
25	9	2	2595
26	9	6	830
27	10	1	2999
28	10	4	999
29	11	3	2900
30	12	3	1499
31	12	2	1999
32	12	3	1499
33	13	1	1420
34	13	1	1420
35	13	1	1420
36	13	3	1499
37	13	3	1499
38	13	3	1499
39	13	3	1499
40	13	3	1499
41	13	3	1499
42	13	3	1499
43	13	3	1499
44	13	3	1499
45	14	2	1999
46	14	2	1999
47	15	1	1420
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-04-05 00:21:33.677657+00
2	2020-04-05 00:48:06.12372+00
3	2020-04-05 00:55:58.262491+00
4	2020-04-05 00:58:26.804053+00
5	2020-04-06 20:55:13.128398+00
6	2020-04-07 23:27:58.575513+00
7	2020-04-12 06:02:04.303937+00
8	2020-04-12 20:47:42.199134+00
9	2020-04-13 02:26:31.987069+00
10	2020-04-13 10:16:17.142688+00
11	2020-04-14 10:05:44.331779+00
12	2020-04-17 21:51:13.986221+00
13	2020-04-20 01:02:58.635428+00
14	2020-04-20 05:01:39.807855+00
15	2020-04-20 05:18:00.793412+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
24	4	tracy	11111	12345 irvine	2020-04-05 01:08:22.604395+00
25	4	tracy	11111	12345 irvine	2020-04-05 01:09:07.532567+00
26	4	tracy	11111	12345 irvine	2020-04-05 01:09:21.267069+00
27	4	tracy	11111	12345 irvine	2020-04-05 02:05:05.545364+00
28	4	tracy	11111	12345 irvine	2020-04-05 02:09:20.21111+00
29	4	tracy	11111	12345 irvine	2020-04-05 02:12:00.36138+00
48	6	Tracy	123	123	2020-04-08 09:06:04.772263+00
49	6	Tracy	123	123	2020-04-08 09:08:17.057617+00
50	6	Tracy	000 00 000	123 Happy Lane	2020-04-08 09:10:33.674624+00
51	6	Tracy	000 00 000	123 Happy Lane	2020-04-08 09:12:38.773268+00
52	6	Tracy	0000 000 0000	123 Happy Lane	2020-04-08 09:15:42.276404+00
53	6	Tracy	0000 000 0000	123 Happy Feet	2020-04-08 09:37:43.237867+00
54	6	Tracy	0000 00 0000	123 Shipping	2020-04-08 09:39:37.485383+00
55	6	Tracy	0000 000 0000	123 Shipping	2020-04-08 10:12:31.265636+00
56	6	Tracy	0000 000 0000	123 Happy St	2020-04-08 10:20:29.616152+00
57	6	Tracy	0000 000 0000	123 Happy Lane	2020-04-08 10:22:52.470222+00
59	8	Tracy	0000 0000 0000 0000	123 Happy Lane	2020-04-13 02:24:48.457733+00
60	9	Tracy	0000 0000 0000 0000	123 Testing St	2020-04-13 09:57:22.710818+00
61	10	Tracy	0000 0000 0000 0000	123 Whatever Lane	2020-04-13 10:24:13.938349+00
62	10	Tracy	000000000000000000	3425678dsfgh	2020-04-13 10:25:20.844102+00
65	13	Tracy	0000 0000 0000	asdfghj	2020-04-20 04:54:58.183319+00
66	13	asdf	asdf	s	2020-04-20 05:01:11.489993+00
67	14	sdfgh	12345676432	s	2020-04-20 05:01:49.778527+00
68	14	asd	asd	asd	2020-04-20 05:05:08.43679+00
69	14	Tracy	123456789023456	H	2020-04-20 05:05:40.245088+00
70	14	asdfghjk	wejk	e	2020-04-20 05:07:14.351761+00
71	14	asdf	asdf	q	2020-04-20 05:17:47.865284+00
74	15	asdasdasd	000000000000000	asd	2020-04-20 05:21:35.249291+00
75	15	asdasdasd	000000	asdasd	2020-04-20 05:22:33.060583+00
76	15	asd	123	23456yrtesdfgh	2020-04-20 06:19:02.843165+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 47, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 15, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 76, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

