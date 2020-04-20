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
19	EltaMD UV Active	2900	/images/EltaMD-UV-Active-Broad-Spectrum.jpg	This water-resistant sunscreen is specially formulated for those with active lifestyles and is also ideal for daily use for both adults and children.	Ingredients: Water/Aqua, Caprylic/Capric Triglyceride, Coco-Caprylate/Caprate, Ethyl Macadamiate, Glycerin, Sorbitan Olivate, Polyglyceryl-6 Polyricinoleate, C15-19 Alkane, Hydrogenated Polyisobutene, Sodium Chloride, Triethoxycaprylylsilane, Silica, Glyceryl Behanate, Hydroxyacetophenone, Polyglyceryl-2 Isostearate, Polyhydroxystearic Acid, Disteardimonium Hectorite, 1,2-Hexanediol, Caprylyl Glycol, Hydrolized Jojoba Esters, Xanthan Gum, Dimethicone, Sclerotium Gum, Trisodium Ethylenediamine Disuccinate, Lecithin, Pullulan, Jojoba Esters, Polygonum Aviculare Extract, Tocopherol, Malic Acid.
1	Nivea Sun Protect	1500	/images/nivea-sunscreen.jpg	UV gel that feels like skin lotion and spreads like water on your skin. Gentle on skin, and will not leave white residue.	Ingredients: Water, Ethylhexyl Methoxycinnamate, Ethanol, PG, Dimethicone, Ethylhexyl Triazone, Hexyl Diethylaminohydroxybenzoylbenzoate, BG, Lysine Dilauroyl Glutamate Na, Quince Seed Extract, Beet Wax Extract, Kihaeda Bark Extract, Hydrolyzed Hyaluronic Acid, (Acrylates / Alkyl Acrylate (C 10 - 30)) Crosspolymer, Carbomer, Tocopherol Acetate, Sodium Hydroxide, BHT, Methylparaben
2	Skin Aqua Tone Up	2000	/images/skin-aqua.jpg	Cosme award winning sunscreen (2018, 2019). SPF50+ PA++++ A lavender shade UV essence for clear, dewy skin.	Ingredients: Water, Alcohol, Ethylhexyl Methoxycinnamate, Butylene Glycol, Diphenylsiloxy Phenyl Trimethicone, Titanium Dioxide, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Sodium Hyaluronate, Magnesium Ascorbyl Phosphate, Passiflora Edulis Fruit Extract, Hydrolyzed Prunus Domestica, Rosa Roxburghii Fruit Extract, Bis-PEG-18 Methyl Ether Dimethyl Silane, Methyl Methacrylate/Glycol Dimethacrylate Crosspolymer, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Acrylates Copolymer, Polysorbate 60, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Triethanolamine, Ammonium Acryloyldimethyltaurate/VP Copolymer, Silica, PEG-12 Dimethicone, Polystyrene, Polyvinyl Alcohol, Disodium EDTA, Xantham Gum, Alumina, Butylated Hydroxytoluene, Polyglyceryl-2 Triisostearate, Synthetic Fluorphlogopite, Tin Oxide, CI 73360, CI 42090, Fragrance
3	Biore Aqua Rich	1500	/images/biore-aqua-rich.jpg	Light skin feel, absorbs quickly, leaves no white cast. Infused with Hyaluronic Acid & Royal Jelly Extract.	Water, Alcohol, Ethylhexyl Methoxycinnamate, Ethylhexyl Triazone, Isopropyl Palmitate, Lauryl Methacrylate/Sodium Methacrylate Crosspolymer, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Hydrogenated Polyisobutene, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Dextrin Palmitate, Butylene Glycol, Xylitol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Dimethicone, C12-15 Alkyl Benzoate, Glycerin, Propanediol, Glyceryl Stearate, Glyceryl Behenate, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Potassium Hydroxide, Cetyl Alcohol, Agar, Sorbitan Distearate, Isoceteth-20, Polyvinyl Alcohol, Dimethicone/Vinyl Dimethicone Crosspolymer, Stearoyl Glutamic Acid, Arginine, Disodium EDTA, Fragrance, BHT, Sodium Hydroxide, Tocopherol, Royal Jelly Extract, Sodium Hyaluronate, Phenoxyethanol, Methylparaben
4	Krave Sun Fluid	2000	/images/krave.jpg	A gentle, antioxidant-rich day fluid that protects your skin from harsh environmental stressors.	Ingredients: Water, Butyloctyl Salicylate, Dibutyl Adipate, Beta Vulgaris (Beet) Root Extract, Alcohol, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Ethylhexyl Triazone, Glycerin,  Pentylene Glycol, Isoamyl p-Methoxycinnamate, Polysilicone-15, Inulin Lauryl Carbamate, Methyl Methacrylate Crosspolymer, Sodium Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Tromethamine, Methylpropanediol, Isohexadecane, Caprylyl Glycol, Glyceryl Caprylate, Polymethylsilsesquioxane, 1,2-Hexanediol, Polysorbate 80, Lithospermum Erythrorhizon Root Extract, Macadamia Ternifolia Seed Oil, Sorbitan Oleate, Ethylhexylglycerin, Allantoin, Epigallocatechin Gallate, Sodium Ascorbyl Phosphate, Butylene Glycol, Resveratrol
5	Make P:rem Sun Fluid	3400	/images/make-prem-sun-fluid.png	This sun fluid, a 100% reflective sunscreen for body and face, contains mineral filter that blocks out UVA and UVB simulataneously.	Ingredients: Water, Cyclomethicone, Zinc Oxide (CI 77947), Propanediol, Titanium Dioxide (CI 77891), Dicaprylyl Carbonate, Polyglyceryl-3 Polydimethylsiloxyethyl Dimethicone, Cetyl Ethylhexanoate, 1,2-Hexanediol, Disteardimonium Hectorite, Magnesium Sulfate, Salvia Hispanica (Chia) Seed Extract, Centella Asiatica (Gotu Kola) Extract, Houttuynia Cordata Extract, Hydrogen Dimethicone, Aluminum Hydroxide, Polyglyceryl-2 Dipolyhydroxystearate, Stearic Acid, Dimethicone Crosspolymer, Phenyl Trimethicone, Fructooligosaccharides, Saccharide Hydrolysate, Pullulan, Citrus Aurantium Bergamia (Bergamot) Fruit Oil, Ethylhexylglycerin, Octyldodecanol, Salvia Officinalis (Sage) Oil, Betula Platyphylla Japonica Juice, Dipropylene Glycol, Echium Plantagineum Seed Oil, Xylitylglucoside, Sodium Palmitoyl Proline, Rubus Arcticus Callus Extract, Anhydroxylitol, Xylitol, Nymphaea Alba (White Water Lily) Flower Extract, Butylene Glycol, Cardiospermum Halicacabum Flower/Leaf/Vine Extract, Helianthus Annuus (Sunflower) Seed Oil Unsaponifiables, Glucose, Tocopherol, Sodium Hyaluronate
6	Make P:rem Sun Gel	3200	/images/make-prem-sun-gel.png	Lightweight broad spectrum SPF 50+ PA++++ UVA/UVB protection while cooling down skin's temperature.	Ingredients: Water, Ethylhexyl Methoxycinnamate, Homosalate, Ethylhexyl Salicylate, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Propanediol, Niacinamide, Dimethicone Crosspolymer, Pentylene Glycol, Salvia Hispanica Seed Extract, Centella Asiatica Extract, Houttuynia Cordata Extract, Ammonium Acryloyldimethyltaurate/VP Copolymer, Fragrance, Glyceryl Caprylate, Fructooligosaccharides, Saccharide Hydrolysate, Ethylhexylglycerin, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Tromethamine, Pullulan, Adenosine, 1,2-Hexanediol, Betula Alba Juice, Dipropylene Glycol, Butylene Glycol, Xylitylglucoside, Sodium Palmitoyl Proline, Rubus Arcticus Callus Extract, Anhydroxylitol, Xylitol, Nymphaea Alba Flower Extract, Glycerin, Chamaecyparis Obtusa Leaf Extract, Glucose, Polyglyceryl-10 Oleate, Alcohol, Lecithin, Sodium Dilauramidoglutamide Lysine, Thermus Thermophillus Ferment, Phytosterols, Hydrogenated Lecithin, Lysolecithin, Sodium Ascorbyl Phosphate, Ascophyllum Nodosum Extract, Sodium Hyaluronate, Leuconostoc/Radish Root Ferment Filtrate, Potassium Sorbate, Disodium EDTA, Citric Acid
7	Coola Scalp and Hair Mist	2600	/images/coola-hair-scalp.jpg	COOLA's Scalp & Hair Mist Organic Sunscreen SPF 30 will protect and nourish from roots to tips.	Ingredients: Active: Avobenzone 2.5%, Homosalate 6.0%, Octisalate 5.0%, Octocrylene 7.0%. Inactive: Alcohol Denat.(ORGANIC), Algae Extract, C12-15 Alkyl Benzoate, Centella Asiatica Extract, Cinnamidopropyltrimonium Chloride, Citrus Aurantium Bergamia (ORGANIC Bergamot) Fruit Oil, Elaeis Guineensis (Palm) Fruit Extract, Flavor, Glycerin (ORGANIC), Glycine Soja (Soybean) Seed Extract, Oryza Sativa (Rice) Extract, Panthenol, Plumeria Acutifolia Flower Extract, Water (Aqua), Xylitol.
8	The One Pure Mist	2200	/images/fekkai-atelier-pure-mist.jpg	Experience supernatural luxury hair care - performance without compromise. 100% fragranced by nature.	Ingredients: Water/Aqua/Eau, Propanediol, Stearalkonium Chloride, Cetearyl Alcohol, Phenoxyethanol, Sorbitan Oleate Decylglucoside Crosspolymer, Panthenol, Glycerin, Behentrimonium Methosulfate, Potassium Sorbate, Cetearamidoethyldiethonium Succinoyl Hydrolyzed Pea Protein, Limonene, Alcohol Denat., Linalool, Sodium Chloride, Argania Spinosa Kernel Oil, Cocos Nucifera (Coconut) Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Butyrospermum Parkii (Shea) Butter, Citric Acid, Geraniol, Aloe Barbadensis Leaf Juice, Citral, Leontopodium Alpinum Flower/Leaf Extract, Sodium Benzoate, Oryza Sativa (Rice) Seed Protein, Phytic Acid, Oryza Sativa (Rice) Extract, Gluconolactone, Sodium Sulfite, Calcium Gluconatem, Fragrance/Parfum. (100% naturally derived fragrance).
9	GDY Prime	2800	/images/gdy-prime.png	Prime those locks. Color Kind hair primer maintains color vibrancy against harsh heat, UV rays and humidity.	Ingredients: Water (Eau, Aqua), Polysorbate 80, Propanediol Ppg-5-Ceteth-20, Aloe Barbadensis Leaf Juice, Bht, Butyl Methoxydibenzoylmethane, Cetrimonium Chloride, Citric Acid , Dimethicone Pg-Diethylmonium, Chloride, Dipropylene Glycol, Disodium Edta, Ethylhexyl, Methoxycinnamate, Ethylhexyl Salicylate, Ethylhexylglycerin, Citrus Aurantium Bergamia (Bergamot) Peel Oil, Juniperus Virginiana (Cedarwood) Oil, Coriandrum Sativum (Coriander) Fruit Oil, Citrus Limon (Lemon) Peel Oil, Lemon Oil Terpenes, Citrus Aurantium Amara (Bitter Orange) Flower Oil, Citrus Aurantium Dulcis (Orange) Peel Oil, Citrus Aurantium Amara (Bitter Orange) Leaf/Twig Oil, Mentha Viridis (Spearmint) Leaf Oil, Glycerin, Peg-12 Dimethicone , Peg-40 Hydrogenated Castor Oil, Phenoxyethanol, Polyquaternium-10, Polyquaternium-70, Ppg-26-Buteth-26, Quaternium-80, Silicone Quaternium-8, Sodium Hydroxide , Trideceth-10, Limonene, Linalool, Hexyl Cinnamal, Citral, Geraniol.
10	Rita Hazan Lock + Block	2600	/images/rita-hazan.jpg	A dry, weightless mist that locks in color and style, blocks out humidity and UV rays	Ingredients: Hydrofluorocarbon 152A, Alcohol Denat., Acrylates/Octylacrylamide Copolymer, Aminomethyl Propanol, Isopentyldiol, Dimethyl Stearamine, Tocopheryl Acetate, Panthenol, Retinyl Palmitate, Benzophenone-4, Ethylhexyl Methoxycinnamate, Cocodimonium Hydroxypropyl Hydrolyzed Keratin, Aminopropyl Phenyl Trimethicone, Cyclotetrasiloxane, Cyclopentasiloxane, Fragrance (Parfum), Benzyl Salicylate, Hexyl Cinnamal, Limonene, Linalool.
11	Dermalogica Physical Defense	5400	/images/Dermalogica-Invisible-Physical-Defense.jpg	Dermalogica's sheer, lightweight physical sunscreen features non-nano zinc oxide that protects against blue light, UV rays and pollution.	Ingredients: Water/Aqua/Eau, Zinc Oxide, Caprylic/Capric Triglyceride, C12-15 Alkyl Benzoate, Dimethicone, Butyloctyl Salicylate, Butylene Glycol, Glycerin, Silica, Polyhydroxystearic Acid, PEG-10 Dimethicone, Argania Spinosa Kernel Oil, Cordyceps Sinensis Extract, Trametes Versicolor Extract, Sodium Hyaluronate, Camellia Sinensis Leaf Extract, Eucalyptus Globulus Leaf Oil, Lavandula Spica (Lavender) Flower Oil, Tocopheryl Acetate, Sodium Chloride, Stearalkonium Hectorite, Pentylene Glycol, Lauryl PEG-9 Polydimethylsiloxyethyl Dimethicone, Propanediol, Dimethicone Crosspolymer, Sodium Citrate, Propylene Carbonate, Xanthan Gum, Caprylyl Glycol, Bisabolol, Lavandula Hybrida Oil, Ethylhexylglycerin, Sodium Hydroxide, Potassium Sorbate, Sodium Benzoate, Linalool, Limonene.
12	SHISEIDO Protector Lotion	4900	/images/Shiseido-Ultimate-Sun-Protector-Lotion.jpg	What it is: An invisible sunscreen veil that becomes stronger when exposed to heat, water, and sweat. Skin Type: Normal, Dry, Combination, and Oily.	Ingredients: Water, Diisopropyl Sebacate, Talc, Methyl Methacrylate Crosspolymer, Dimethicone, Peg/Ppg-9/2 Dimethyl Ether, Sd Alcohol 40-B, Lauryl Peg-9 Polydimethylsiloxyethyl Dimethicone, Triethylhexanoin, Glycerin, Dextrin Palmitate, Sucrose Tetrastearate Triacetate, Isododecane, Ppg-3 Dipivalate, Trimethylsiloxysilicate, Silica, Sodium Chloride, Peg/Ppg-14/7 Dimethyl Ether, Saxifraga Sarmentosa Extract, Camellia Sinensis Leaf Extract, Sophora Angustifolia Root Extract, Ppg-17, Disteardimonium Hectorite, Calcium Stearate, Isostearic Acid, Palmitic Acid, Trisodium Edta, Alcohol, Silica Dimethyl Silylate, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Peg-6, Bht, Tocopherol, Butylene Glycol, Stearic Acid, Sodium Metabisulfite, Syzygium Jambos Leaf Extract, Polysilicone-2, Methylparaben, Fragrance, Iron Oxides.
13	CeraVe Sheer Tint	1600	/images/CeraVe-Hydrating-Sunscreen-Sheer-Tint.jpg	CeraVe Face Sheer Tint Hydrating Sunscreen SPF 30 reflects the sun's harmful rays plus three essential ceramides to help restore skin's natural barrier.	Ingredients:  Active: Titanium Dioxide - 5.5% Zinc Oxide - 10%. Inactive: Water, C12-15 Alkyl Benzoate, Isohexadecane, Isononyl Isononanoate, Dicaprylyl Ether, Peg-30 Dipolyhydroxystearate, Triethylhexanoin, Polyglyceryl-4 Isostearate, Dicaprylyl Carbonate, Ethylene/Acrylic Acid Copolymer, Triethanolamine, Silica, Poly C10-30 Alkyl Acrylate, Stearic Acid, Ceramide Np, Ceramide Ap, Ceramide Eop, Carbomer, Niacinamide, Cetearyl Alcohol, Triethoxycaprylylsilane, Behentrimonium Methosulfate, Sodium Chloride, Salicylic Acid, Sodium Hyaluronate,Sodium Lauroyl Lactylate, Cholesterol, Aluminum Stearate, Alumina, Aluminum Hydroxide, Iron Oxides, Phenoxyethanol, P-Anisic Acid, Chlorphenesin, Tocopherol, Disodium Edta, Disodium Stearoyl Glutamate, Propylene Carbonate, Citric Acid, Caprylyl Glycol, Capryloyl Salicylic Acid, Caprylic/Capric Triglyceride, Diethylhexyl Syringylidenemalonate, Disteardimonium Hectorite, Xanthan Gum, Phytosphingosine, Polyhydroxystearic Acid, Ethylhexylglycerin.
14	Alba Botanica Sweet Pea	1700	/images/Alba-Botanica-Sweet-Pea-Sheer-Shield-Lotion.jpg	Embrace the perfect summer day with this sheer, lightweight sunscreen, featuring the enchanting scent and skin benefits of Sweet Pea Flower extract.	Ingredients: Avobenzone (3.0%), Homosalate (10.0%), Octisalate (5.0%), Octocrylene (10.0%) Other Ingredients: Water (Aqua), Cetyl Alcohol, Glycerin, Glyceryl Stearate SE, Dimethicone, Caprylic/Capric Triglyceride, VP/Hexadecene Copolymer, Citrus Aurantium Dulcis (Orange) Peel Oil, Aloe Barbadensis Leaf Juice (1), Calendula Officinalis Flower Extract (1), Camellia Sinensis Leaf Extract (1), Chamomilla Recutita (Matricaria) Flower Extract *, Ginkgo Biloba Leaf Extract, Lathyrus Odoratus Flower Extract, Lavandula Angustifolia (Lavender) Flower/Leaf/Stem Extract (1), Tocopheryl Acetate, Cetearyl Alcohol, Cetearyl Olivate, Citric Acid, Linalyl Acetate, Polysorbate 60, Sodium Chloride, Sodium Stearoyl Glutamate, Sorbitan Olivate, Squalane, Triethyl Citrate, Xanthan Gum, Alcohol (1), Benzyl Alcohol, Potassium Sorbate, Sodium Benzoate, Amyl Cinnamal, Geraniol, Hydroxycitronellal, Limonene, Linalool. (1) Certified Organic Ingredient
15	Biossance Squalane + Zinc	3000	/images/Biossance-Squalane-Zinc-Sheer-Mineral-Sunscreen.jpg	This powerful, invisible, broad-spectrum, mineral SPF 30 PA +++ protects all skin tones like you’ve never seen—literally.	Ingredients: Zinc Oxide, Water, Caprylic/Capric Triglyceride, Squalane, Glycerin, Cetearyl Alcohol, Methyl Dihydroabietate, Sorbitan Olivate, Coco-Glucoside, Cetyl Palmitate, Polyglyceryl-3 Polyricinoleate, Caprylyl/Capryl Glucoside, Nymphaea Alba Flower Extract, Acacia Senegal Gum, Ethyl Ferulate, Xanthan Gum, Sodium Gluconate, Lecithin, Sodium Palmitoyl Proline, Polyhydroxystearic Acid, Ethylhexylglycerin, Phenoxyethanol, Isostearic Acid.
16	La Roche-Posay Melt-In Milk	2500	/images/La-Roche-Posay-Anthelios.jpg	Melt-in Milk Body Face Sunscreen Lotion Broad Spectrum SPF 100 is a broad-spectrum, oxybenzone-free sunscreen for the face and body.	Ingredients: Water, Polymethylsilsesquioxane, Glycerin, Dimethicone, Poly C10-30 Alkyl Acrylate, Styrene/Acrylates Copolymer, Silica, Caprylyl Methicone, Acrylates/Dimethicone Copolymer, Diethylhexyl Syringylidenemalonate, Peg-100 Stearate, Glyceryl Stearate, Phenoxyethanol, Potassium Cetyl Phosphate, Tocopherol, Caprylyl Glycol, Panthenol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Triethanolamine, Peg-8 Laurate, Inulin Lauryl Carbamate, Chlorphenesin, P-Anisic Acid, Caprylic/Capric Triglyceride, Xanthan Gum, Disodium Edta, Cassia Alata Leaf Extract, Maltodextrin, Sodium Dodecylbenzenesulfonate.
17	Coppertone Glow Hydragel	1500	/images/Coppertone-Glow-Hydragel.jpg	Coppertone Glow SPF 50 sunscreen lotion offers trusted broad spectrum sun protection with a shimmer that leaves the skin with a beautiful glow.	ingredients: Avobenzone 3%, Homosalate 9%, Octisalate 4.5%, Octocrylene 9% Inactive ingredients: water, SD alcohol 40-B, butyloctyl salicylate, diethylhexyl carbonate, glycereth-26, styrene/acrylates copolymer, butylene glycol, diisopropyl adipate, dimethicone, polyamide-8, isododecane, 1,2-hexanediol, ammonium acryloyldimethyltaurate/beheneth-25 methacrylate crosspolymer, glycerin, hydroxyacetophenone, mica, synthetic fluorphlogopite, tocopherol, ethylhexyl methoxycrylene, arachidyl alcohol, iron oxides, bismuth oxychloride, fragrance, xanthum gum, behenyl alcohol, silica, arachidyl glucoside, disodium EDTA, sodium ascorbyl phosphate
18	Colorescience Total Eye	6900	/images/Colorescience-Total-Eye.jpg	Delivering a broad spectrum SPF 35 coverage, the lightweight formula protects the area against further damage from harmful UV exposure.	Aqua/Water, Hydrogenated Polyisobutene, Cyclopentasiloxane, Caprylic/Capric Triglyceride, Lauryl Polyglyceryl-3 Polydimethylsiloxyethyl Dimethicone, Glycerin, Panthenol, Mica, Dimethicone Crosspolymer, Albizia Julibrissin Bark Extract, Sea Water, Sorbitol, Jojoba Esters, Sodium Hyaluronate, Palmitoyl Tripeptide-5, Tremella Fuciformis Sporocarp Extract, Hydrolyzed Algin, Ascophyllum Nodosum Extract, Betaine, Dunaliella Salina Extract, Asparagopsis Armata Extract, Sucrose, Darutoside, Pantolactone, Tocopherol, Sodium Chloride, Dimethicone/Vinyl Dimethicone Crosspolymer, Silica, Polyhydroxystearic Acid, Glyceryl Behenate/Eicosadioate, Dimethicone, Lauroyl Lysine, Dimethiconol, Ethylhexylglycerin, Triethoxycaprylylsilane, Alumina, Phenoxyethanol, Potassium Sorbate, Sodium Benzoate, Citric Acid, Iron Oxides
20	Sol de Janeiro My Sol Stick	2600	/images/sdj-spf-stick.jpg	A sheer SPF 50 stick is a must-have for lips, nose, hands, edges of your swimwear, and tattoos.	Ingredients: Homosalate, Octocrylene, Ethylhexyl Salicylate, Butyl Methoxydibenzoylmethane, Calcium Aluminum Borosilicate, Cocos Nucifera (Coconut) Oil, Dicaprylyl Carbonate, Euterpe Oleracea (Acaí) Fruit Oil, Fragrance, Iron Oxides, Mica, Neopentyl Glycol Diheptanoate, Octyldodecanol, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Silica, Theobroma Grandiflorum (Cupuaçu) Seed Butter, Tin Oxide, Titanium Dioxide, Tocopherol, Tocopheryl Acetate, Vitis Vinifera (Grape) Seed Oil.
21	Tatcha Silken Pore	6500	/images/tatcha-silken-pore-perfecting-sunscreen.jpg	Perfect as a primer for makeup without leaving a chalky finish. Lightweight mineral sunscreen.	Ingredients: Water, Isododecane, Cyclopentasiloxane, Propanediol, Hdi/Trimethylol Hexyllactone Crosspolymer, Glycerin, Dimethicone, Octyldodecyl Neopentanoate, Behenyl Alcohol, Dimethicone/Vinyl Dimethicone Crosspolymer, Rosa Multiflora Fruit Extract, Eriobotrya Japonica Leaf Extract, Stearyl Glycyrrhetinate, Glycyrrhiza Inflata Root Extract, Camellia Sinensis Leaf Extract, Pistacia Lentiscus (Mastic) Gum, Sericin, Algae Extract, Lecithin, Inositol, Polyhydroxystearic Acid, Sorbitan Tristearate, Sodium Dilauramidoglutamide Lysine, Silica, Potassium Sorbate, Beheneth-20, Sodium Acrylate/Acryloyldimethyltaurate/Dimethylacrylamide Crosspolymer, Polymethylsilsesquioxane, Methicone, Trimethylsiloxysilicate, Dimethiconol, Disodium Edta, Fragrance, Ethylhexylglycerin, Alcohol, Phenoxyethanol, Iron Oxides (Ci77491), Tin Oxide (Ci 77861), Mica (Ci 77019), Titanium Dioxide (Ci 77891).
22	Supergoop Daily Moisturizer	3800	/images/supergoop-superscreen-daily-moisturizer.jpg	The clinically tested moisturizer is formulated with ingredients that help block blue light and pollution, too.	Ingredients: Avobenzone 2.5%, Homosalate 8%, Octisalate 5%; Inactive Ingredients: Water, Carthamus Tinctorius (Safflower) Oleosomes, Glycerin, C12-15 Alkyl Benzoate, Polyester-7, Ammonium Acryloyldimethyltaurate/VP Copolymer, Neopentyl Glycol Diheptanoate, Carthamus Tinctorius (Safflower) Seedcake Extract, Aphanizomenon Flos-Aquae Extract, Inulin Lauryl Carbamate, Xanthan Gum, Biosaccharide Gum-4, Cerium Oxide, Platinum Powder, 1,2-Hexanediol, Ethylhexylglycerin, Phenethyl Alcohol, Chlorphenesin.
23	SkinCeuticals Light Moisture	3900	/images/skinceuticals-light-moisture-uv-defense.jpg	Light Moisture UV Defense SPF 50 is a weightless, non comedogenic sunscreen featuring an optimized concentration of UVA/UVB filters.	Ingredients: Avobenzone, Homosalate, Octisalate, Octocrylene, Water, Styrene/Acrylates Copolymer, Dimethicone, Polymethylsilsesquioxane, Butyloctyl Salicylate, Glycerin, Alcohol Denat., Poly C10-30 Alkyl Acrylate, Caprylyl Methicone, Trisiloxane, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Acrylates/Dimethicone Copolymer, Caprylic/Capric Triglyceride, Caprylyl Glycol, Diethylhexyl Syringylidenemalonate, Disodium Edta, Glyceryl Stearate, Inulin Lauryl Carbamate, P-Anisic Acid, Peg-100 Stearate, Peg-8 Laurate, Phenoxyethanol, Potassium Cetyl Phosphate, Tocopherol, Triethanolamine, Xanthan Gum
24	Tarte Mineral Powder	2800	/images/tarte-tarteguard-mineral-powder-sunscreen.jpg	Tarteguard Mineral Powder Sunscreen is a translucent, mineral powder sunscreen that defends skin from sun damage.	Ingredients: Polymethylsilsesquioxane, Silica, Jojoba Esters, Caprylyl Glycol, Alumina, Sodium Dehydroacetate, Phenoxyethanol, Vanillin, Caprylic/Capric Triglyceride, Hexylene Glycol, Vanilla Planifolia Fruit Extract, Aluminum Dimyristate, Triethoxycaprylylsilane, Disodium Stearoyl Glutamate, Iron Oxides, Mica.
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

