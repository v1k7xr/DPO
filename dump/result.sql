--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: cd; Type: TABLE; Schema: public; Owner: vbub
--

CREATE TABLE public.cd (
    cd_id integer NOT NULL,
    title character varying(50) NOT NULL,
    artist character varying(100) NOT NULL,
    country character varying(50) NOT NULL,
    company character varying(45) NOT NULL,
    price character varying(10) NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.cd OWNER TO vbub;

--
-- Name: cd_cd_id_seq; Type: SEQUENCE; Schema: public; Owner: vbub
--

CREATE SEQUENCE public.cd_cd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cd_cd_id_seq OWNER TO vbub;

--
-- Name: cd_cd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vbub
--

ALTER SEQUENCE public.cd_cd_id_seq OWNED BY public.cd.cd_id;


--
-- Name: cd cd_id; Type: DEFAULT; Schema: public; Owner: vbub
--

ALTER TABLE ONLY public.cd ALTER COLUMN cd_id SET DEFAULT nextval('public.cd_cd_id_seq'::regclass);


--
-- Data for Name: cd; Type: TABLE DATA; Schema: public; Owner: vbub
--

COPY public.cd (cd_id, title, artist, country, company, price, year) FROM stdin;
1	Имперская Пародия	Боб Дилан	США	Колумбия	10.90	1985
2	Спрячь свое сердце	Бонни Тайлер	Соединенное Королевство	Записи си-би-эс	9.90	1988
3	Лучшие Хиты	Долли Партон	США	Ар-Си-Эй	9.90	1982
4	Still got the blues	Гарри Мур	Соединенное Королевство	Virgin records	10.20	1990
5	Эрос	Эрос Рамазотти	ЕС	BMG	9.90	1997
6	Только одну ночь	Бии Гиис	Соединенное Королевство	Полидор	10.90	1998
7	Мама Сильвии	Доктор Хук	Соединенное Королевство	Си-би-эс	8.10	1973
8	Мэгги Мэй	Род Стюарт	Соединенное Королевство	Пиквик	8.50	1990
9	Романза	Андреа Бочелли	ЕС	Полидор	10.80	1996
10	Когда мужчина любит женщину	Пирси Слидж	США	Атлантика	8.70	1987
11	Черный Ангел	Дикая Роза	ЕС	Мега	10.90	1995
12	1999 Номинанты Грэмми	(несколько)	США	Грэмми	10.20	1999
13	Для хороших времен	Кенни Роджерс	Соединенное Королевство	Mucik Мастер	8.70	1995
14	Стиль Большого Человека	Уилл Смит	США	Колумбия	9.90	1997
15	Ниссовый Мед	Ван Моррисон	Соединенное Королевство	Полидор	8.20	1971
16	Соулсвилл	Джорн Хоэл	Норвегия	WEA	7.90	1996
17	Лучшее из	Кэт Стивенс	Соединенное Королевство	Исландия	8.90	1990
18	Стоп	Сэм Браун	Соединенное Королевство	А и М	8.90	1988
19	Мост Шпионов	T'Pau	Соединенное Королевство	Сирена	7.90	1987
20	Приватный Танцор	Тина Тернер	Соединенное Королевство	Капитолий	8.90	1983
21	Midt om natten	Ким Ларсен	ЕС	Смесь	7.80	1983
22	Паваротти Гала Концерт	Лучиано Паваротти	Соединенное Королевство	ДЕККА	9.90	1991
23	Док в заливе	Отис Реддинг	США	Атлантика	7.90	1987
24	Книга с картинками	Симпли Рэд	ЕС	Электра	7.20	1985
25	Красный	Коммунары	Соединенное Королевство	Лондон	7.80	1987
26	Освободи мое сердце	Джо Коккер	США	EMI	8.20	1987
\.


--
-- Name: cd_cd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vbub
--

SELECT pg_catalog.setval('public.cd_cd_id_seq', 26, true);


--
-- Name: cd cd_pkey; Type: CONSTRAINT; Schema: public; Owner: vbub
--

ALTER TABLE ONLY public.cd
    ADD CONSTRAINT cd_pkey PRIMARY KEY (cd_id);


--
-- Name: TABLE cd; Type: ACL; Schema: public; Owner: vbub
--

GRANT ALL ON TABLE public.cd TO cdman;


--
-- Name: SEQUENCE cd_cd_id_seq; Type: ACL; Schema: public; Owner: vbub
--

GRANT SELECT,USAGE ON SEQUENCE public.cd_cd_id_seq TO cdman;


--
-- PostgreSQL database dump complete
--

