--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-04 06:00:55 UTC

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
-- TOC entry 2974 (class 1262 OID 18321)
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
-- TOC entry 204 (class 1259 OID 18327)
-- Name: dim_actores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_actores (
    pk_actor bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    actor_id integer,
    actor_nombre character varying(45),
    actor_apellido character varying(45)
);


ALTER TABLE public.dim_actores OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18325)
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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 203
-- Name: dim_actores_pk_actor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_actores_pk_actor_seq OWNED BY public.dim_actores.pk_actor;


--
-- TOC entry 202 (class 1259 OID 18322)
-- Name: dim_bridge_pelicula_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_bridge_pelicula_categorias (
    pk_pelicula integer,
    pk_categoria integer,
    pk_bridge_categoria_pelicula bigint NOT NULL
);


ALTER TABLE public.dim_bridge_pelicula_categorias OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18524)
-- Name: dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 214
-- Name: dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq OWNED BY public.dim_bridge_pelicula_categorias.pk_bridge_categoria_pelicula;


--
-- TOC entry 210 (class 1259 OID 18426)
-- Name: dim_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_categorias (
    pk_categoria bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    category_id integer,
    categoria character varying(25)
);


ALTER TABLE public.dim_categorias OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18424)
-- Name: dim_categorias_pk_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_categorias_pk_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_categorias_pk_categoria_seq OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 209
-- Name: dim_categorias_pk_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_categorias_pk_categoria_seq OWNED BY public.dim_categorias.pk_categoria;


--
-- TOC entry 213 (class 1259 OID 18480)
-- Name: dim_fechas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_fechas (
    fecha timestamp without time zone,
    semana bigint,
    mes bigint,
    trimestre bigint,
    semestre bigint,
    anio bigint
);


ALTER TABLE public.dim_fechas OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18450)
-- Name: dim_lenguajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_lenguajes (
    pk_lenguaje bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    language_id integer,
    lenguaje character varying(20)
);


ALTER TABLE public.dim_lenguajes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18448)
-- Name: dim_lenguajes_pk_lenguaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_lenguajes_pk_lenguaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_lenguajes_pk_lenguaje_seq OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 211
-- Name: dim_lenguajes_pk_lenguaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_lenguajes_pk_lenguaje_seq OWNED BY public.dim_lenguajes.pk_lenguaje;


--
-- TOC entry 206 (class 1259 OID 18359)
-- Name: dim_peliculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_peliculas (
    pk_pelicula bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    film_id integer,
    pelicula_titulo character varying(255),
    pelicula_descripcion text
);


ALTER TABLE public.dim_peliculas OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18357)
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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 205
-- Name: dim_peliculas_pk_pelicula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_peliculas_pk_pelicula_seq OWNED BY public.dim_peliculas.pk_pelicula;


--
-- TOC entry 208 (class 1259 OID 18370)
-- Name: dim_sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_sucursales (
    pk_sucursal bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    store_id integer,
    nombre_sucursal text,
    distrito character varying(20),
    "dirección" character varying(50)
);


ALTER TABLE public.dim_sucursales OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18368)
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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 207
-- Name: dim_sucursales_pk_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_sucursales_pk_sucursal_seq OWNED BY public.dim_sucursales.pk_sucursal;


--
-- TOC entry 218 (class 1259 OID 18542)
-- Name: fact_actuaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_actuaciones (
    pk_actuacion bigint NOT NULL,
    pk_pelicula integer,
    pk_actor integer
);


ALTER TABLE public.fact_actuaciones OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18540)
-- Name: fact_actuaciones_pk_actuacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_actuaciones_pk_actuacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_actuaciones_pk_actuacion_seq OWNER TO postgres;

--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 217
-- Name: fact_actuaciones_pk_actuacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_actuaciones_pk_actuacion_seq OWNED BY public.fact_actuaciones.pk_actuacion;


--
-- TOC entry 216 (class 1259 OID 18534)
-- Name: fact_alquileres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_alquileres (
    pk_alquiler bigint NOT NULL,
    "gancias por alquiler" double precision,
    fecha_de_alquiler timestamp without time zone,
    pk_pelicula integer,
    pk_sucursal integer,
    pk_lenguaje integer
);


ALTER TABLE public.fact_alquileres OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18532)
-- Name: fact_alquileres_pk_alquiler_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_alquileres_pk_alquiler_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_alquileres_pk_alquiler_seq OWNER TO postgres;

--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 215
-- Name: fact_alquileres_pk_alquiler_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_alquileres_pk_alquiler_seq OWNED BY public.fact_alquileres.pk_alquiler;


--
-- TOC entry 2826 (class 2604 OID 18330)
-- Name: dim_actores pk_actor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_actores ALTER COLUMN pk_actor SET DEFAULT nextval('public.dim_actores_pk_actor_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 18526)
-- Name: dim_bridge_pelicula_categorias pk_bridge_categoria_pelicula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_bridge_pelicula_categorias ALTER COLUMN pk_bridge_categoria_pelicula SET DEFAULT nextval('public.dim_bridge_pelicula_categorias_pk_bridge_categoria_pelicula_seq'::regclass);


--
-- TOC entry 2829 (class 2604 OID 18429)
-- Name: dim_categorias pk_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categorias ALTER COLUMN pk_categoria SET DEFAULT nextval('public.dim_categorias_pk_categoria_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 18453)
-- Name: dim_lenguajes pk_lenguaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_lenguajes ALTER COLUMN pk_lenguaje SET DEFAULT nextval('public.dim_lenguajes_pk_lenguaje_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 18362)
-- Name: dim_peliculas pk_pelicula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_peliculas ALTER COLUMN pk_pelicula SET DEFAULT nextval('public.dim_peliculas_pk_pelicula_seq'::regclass);


--
-- TOC entry 2828 (class 2604 OID 18373)
-- Name: dim_sucursales pk_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_sucursales ALTER COLUMN pk_sucursal SET DEFAULT nextval('public.dim_sucursales_pk_sucursal_seq'::regclass);


--
-- TOC entry 2832 (class 2604 OID 18545)
-- Name: fact_actuaciones pk_actuacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_actuaciones ALTER COLUMN pk_actuacion SET DEFAULT nextval('public.fact_actuaciones_pk_actuacion_seq'::regclass);


--
-- TOC entry 2831 (class 2604 OID 18537)
-- Name: fact_alquileres pk_alquiler; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_alquileres ALTER COLUMN pk_alquiler SET DEFAULT nextval('public.fact_alquileres_pk_alquiler_seq'::regclass);


--
-- TOC entry 2833 (class 1259 OID 18331)
-- Name: idx_dim_actores_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_actores_lookup ON public.dim_actores USING btree (actor_id);


--
-- TOC entry 2834 (class 1259 OID 18332)
-- Name: idx_dim_actores_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_actores_tk ON public.dim_actores USING btree (pk_actor);


--
-- TOC entry 2839 (class 1259 OID 18430)
-- Name: idx_dim_categorias_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_categorias_lookup ON public.dim_categorias USING btree (category_id);


--
-- TOC entry 2840 (class 1259 OID 18431)
-- Name: idx_dim_categorias_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_categorias_tk ON public.dim_categorias USING btree (pk_categoria);


--
-- TOC entry 2841 (class 1259 OID 18454)
-- Name: idx_dim_lenguajes_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_lenguajes_lookup ON public.dim_lenguajes USING btree (language_id);


--
-- TOC entry 2842 (class 1259 OID 18455)
-- Name: idx_dim_lenguajes_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_lenguajes_tk ON public.dim_lenguajes USING btree (pk_lenguaje);


--
-- TOC entry 2835 (class 1259 OID 18366)
-- Name: idx_dim_peliculas_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_peliculas_lookup ON public.dim_peliculas USING btree (film_id);


--
-- TOC entry 2836 (class 1259 OID 18367)
-- Name: idx_dim_peliculas_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_peliculas_tk ON public.dim_peliculas USING btree (pk_pelicula);


--
-- TOC entry 2837 (class 1259 OID 18377)
-- Name: idx_dim_sucursales_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_sucursales_lookup ON public.dim_sucursales USING btree (store_id);


--
-- TOC entry 2838 (class 1259 OID 18378)
-- Name: idx_dim_sucursales_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_sucursales_tk ON public.dim_sucursales USING btree (pk_sucursal);


-- Completed on 2020-11-04 06:00:55 UTC

--
-- PostgreSQL database dump complete
--


