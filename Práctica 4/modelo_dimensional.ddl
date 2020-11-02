--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-02 22:24:18 UTC

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
-- TOC entry 2971 (class 1262 OID 17793)
-- Name: dwh; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dwh WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE dwh OWNER TO postgres;

\connect dwh

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
-- TOC entry 204 (class 1259 OID 17862)
-- Name: dim_actores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_actores (
    pk_actor bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    actor_id integer,
    nombre character varying(45),
    apellido character varying(45)
);


ALTER TABLE public.dim_actores OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17860)
-- Name: dim_actores_pk_actor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_actores_pk_actor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_actores_pk_actor_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 203
-- Name: dim_actores_pk_actor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_actores_pk_actor_seq OWNED BY public.dim_actores.pk_actor;


--
-- TOC entry 202 (class 1259 OID 17857)
-- Name: dim_bridge_pelicula_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_bridge_pelicula_categorias (
    film_id smallint,
    category_id smallint,
    last_update timestamp without time zone,
    pk_pelicula integer,
    pk_categoria integer
);


ALTER TABLE public.dim_bridge_pelicula_categorias OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17870)
-- Name: dim_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_categoria (
    pk_categoria bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    category_id integer,
    nombre character varying(25),
    last_update timestamp without time zone
);


ALTER TABLE public.dim_categoria OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17868)
-- Name: dim_categoria_pk_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_categoria_pk_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_categoria_pk_categoria_seq OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 205
-- Name: dim_categoria_pk_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_categoria_pk_categoria_seq OWNED BY public.dim_categoria.pk_categoria;


--
-- TOC entry 208 (class 1259 OID 17878)
-- Name: dim_clasificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_clasificacion (
    pk_clasificacion bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    film_id integer,
    "clasificación" text
);


ALTER TABLE public.dim_clasificacion OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17876)
-- Name: dim_clasificacion_pk_clasificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_clasificacion_pk_clasificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_clasificacion_pk_clasificacion_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 207
-- Name: dim_clasificacion_pk_clasificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_clasificacion_pk_clasificacion_seq OWNED BY public.dim_clasificacion.pk_clasificacion;


--
-- TOC entry 210 (class 1259 OID 17889)
-- Name: dim_fecha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_fecha (
    pk_fecha bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    rental_date timestamp without time zone,
    semana bigint,
    mes bigint,
    trimestre bigint,
    semestre bigint,
    anio bigint
);


ALTER TABLE public.dim_fecha OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17887)
-- Name: dim_fecha_pk_fecha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_fecha_pk_fecha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_fecha_pk_fecha_seq OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 209
-- Name: dim_fecha_pk_fecha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_fecha_pk_fecha_seq OWNED BY public.dim_fecha.pk_fecha;


--
-- TOC entry 212 (class 1259 OID 17897)
-- Name: dim_peliculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_peliculas (
    pk_pelicula bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    film_id integer,
    "título" character varying(255),
    "descripción" text
);


ALTER TABLE public.dim_peliculas OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17895)
-- Name: dim_peliculas_pk_pelicula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_peliculas_pk_pelicula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_peliculas_pk_pelicula_seq OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 211
-- Name: dim_peliculas_pk_pelicula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_peliculas_pk_pelicula_seq OWNED BY public.dim_peliculas.pk_pelicula;


--
-- TOC entry 216 (class 1259 OID 17943)
-- Name: dim_sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_sucursales (
    pk_sucursal bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    store_id integer,
    "dirección 1" character varying(50),
    "dirección 2" character varying(50),
    district character varying(20),
    nombre_sucursal text
);


ALTER TABLE public.dim_sucursales OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17941)
-- Name: dim_sucursales_pk_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_sucursales_pk_sucursal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_sucursales_pk_sucursal_seq OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 215
-- Name: dim_sucursales_pk_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_sucursales_pk_sucursal_seq OWNED BY public.dim_sucursales.pk_sucursal;


--
-- TOC entry 214 (class 1259 OID 17917)
-- Name: fact_actuacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_actuacion (
    actor_id smallint,
    film_id smallint,
    last_update timestamp without time zone,
    pk_pelicula integer,
    pk_actor integer
);


ALTER TABLE public.fact_actuacion OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17914)
-- Name: fact_alquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_alquiler (
    "gancias por alquiler" double precision,
    rental_id integer,
    rental_date timestamp without time zone,
    film_id smallint,
    store_id smallint,
    last_update timestamp without time zone,
    pk_pelicula integer,
    pk_sucursal integer,
    pk_clasificacion integer
);


ALTER TABLE public.fact_alquiler OWNER TO postgres;

--
-- TOC entry 2822 (class 2604 OID 17865)
-- Name: dim_actores pk_actor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_actores ALTER COLUMN pk_actor SET DEFAULT nextval('public.dim_actores_pk_actor_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 17873)
-- Name: dim_categoria pk_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categoria ALTER COLUMN pk_categoria SET DEFAULT nextval('public.dim_categoria_pk_categoria_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 17881)
-- Name: dim_clasificacion pk_clasificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_clasificacion ALTER COLUMN pk_clasificacion SET DEFAULT nextval('public.dim_clasificacion_pk_clasificacion_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 17892)
-- Name: dim_fecha pk_fecha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_fecha ALTER COLUMN pk_fecha SET DEFAULT nextval('public.dim_fecha_pk_fecha_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 17900)
-- Name: dim_peliculas pk_pelicula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_peliculas ALTER COLUMN pk_pelicula SET DEFAULT nextval('public.dim_peliculas_pk_pelicula_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 17946)
-- Name: dim_sucursales pk_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_sucursales ALTER COLUMN pk_sucursal SET DEFAULT nextval('public.dim_sucursales_pk_sucursal_seq'::regclass);


--
-- TOC entry 2828 (class 1259 OID 17866)
-- Name: idx_dim_actores_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_actores_lookup ON public.dim_actores USING btree (actor_id);


--
-- TOC entry 2829 (class 1259 OID 17867)
-- Name: idx_dim_actores_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_actores_tk ON public.dim_actores USING btree (pk_actor);


--
-- TOC entry 2830 (class 1259 OID 17874)
-- Name: idx_dim_categoria_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_categoria_lookup ON public.dim_categoria USING btree (category_id);


--
-- TOC entry 2831 (class 1259 OID 17875)
-- Name: idx_dim_categoria_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_categoria_tk ON public.dim_categoria USING btree (pk_categoria);


--
-- TOC entry 2832 (class 1259 OID 17885)
-- Name: idx_dim_clasificacion_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_clasificacion_lookup ON public.dim_clasificacion USING btree (film_id);


--
-- TOC entry 2833 (class 1259 OID 17886)
-- Name: idx_dim_clasificacion_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_clasificacion_tk ON public.dim_clasificacion USING btree (pk_clasificacion);


--
-- TOC entry 2834 (class 1259 OID 17893)
-- Name: idx_dim_fecha_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_fecha_lookup ON public.dim_fecha USING btree (rental_date);


--
-- TOC entry 2835 (class 1259 OID 17894)
-- Name: idx_dim_fecha_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_fecha_tk ON public.dim_fecha USING btree (pk_fecha);


--
-- TOC entry 2836 (class 1259 OID 17904)
-- Name: idx_dim_peliculas_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_peliculas_lookup ON public.dim_peliculas USING btree (film_id);


--
-- TOC entry 2837 (class 1259 OID 17905)
-- Name: idx_dim_peliculas_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_peliculas_tk ON public.dim_peliculas USING btree (pk_pelicula);


--
-- TOC entry 2838 (class 1259 OID 17947)
-- Name: idx_dim_sucursales_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_sucursales_lookup ON public.dim_sucursales USING btree (store_id);


--
-- TOC entry 2839 (class 1259 OID 17948)
-- Name: idx_dim_sucursales_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_sucursales_tk ON public.dim_sucursales USING btree (pk_sucursal);


-- Completed on 2020-11-02 22:24:19 UTC

--
-- PostgreSQL database dump complete
--

