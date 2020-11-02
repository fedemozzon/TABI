-- Database: dwh

-- DROP DATABASE dwh;

CREATE DATABASE dwh
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

//UNA VEZ CREADA LA BASE, EJECUTAR ESTE SCRIPT DENTRO DE LA BASE 

	-- Paso                : actualiza_bridge_pelicula_categorias-- Conexión de base de datos: postgres dwh-- SQL                  : 
CREATE TABLE "public".dim_bridge_pelicula_categorias
(
  film_id SMALLINT
, category_id SMALLINT
, last_update TIMESTAMP
, pk_pelicula INTEGER
, pk_categoria INTEGER
)
;
-------------------------------------------------------------------------------------------
-- Paso                : pk_actor-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_actores
(
  pk_actor BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, actor_id INTEGER
, nombre VARCHAR(45)
, apellido VARCHAR(45)
)
;CREATE INDEX idx_dim_actores_lookup ON "public".dim_actores(actor_id)
;
CREATE INDEX idx_dim_actores_tk ON "public".dim_actores(pk_actor)
;

-------------------------------------------------------------------------------------------
-- Paso                : pk_categoria-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_categoria
(
  pk_categoria BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, category_id INTEGER
, nombre VARCHAR(25)
, last_update TIMESTAMP
)
;CREATE INDEX idx_dim_categoria_lookup ON "public".dim_categoria(category_id)
;
CREATE INDEX idx_dim_categoria_tk ON "public".dim_categoria(pk_categoria)
;

-------------------------------------------------------------------------------------------
-- Paso                : pk_clasificacion-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_clasificacion
(
  pk_clasificacion BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, film_id INTEGER
, clasificación TEXT
)
;CREATE INDEX idx_dim_clasificacion_lookup ON "public".dim_clasificacion(film_id)
;
CREATE INDEX idx_dim_clasificacion_tk ON "public".dim_clasificacion(pk_clasificacion)
;

-------------------------------------------------------------------------------------------
-- Paso                : pk_fecha-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_fecha
(
  pk_fecha BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, rental_date TIMESTAMP
, semana BIGINT
, mes BIGINT
, trimestre BIGINT
, semestre BIGINT
, anio BIGINT
)
;CREATE INDEX idx_dim_fecha_lookup ON "public".dim_fecha(rental_date)
;
CREATE INDEX idx_dim_fecha_tk ON "public".dim_fecha(pk_fecha)
;

-------------------------------------------------------------------------------------------
-- Paso                : pk_pelicula-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_peliculas
(
  pk_pelicula BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, film_id INTEGER
, título VARCHAR(255)
, descripción TEXT
)
;CREATE INDEX idx_dim_peliculas_lookup ON "public".dim_peliculas(film_id)
;
CREATE INDEX idx_dim_peliculas_tk ON "public".dim_peliculas(pk_pelicula)
;

-------------------------------------------------------------------------------------------
-- Paso                : pk_sucursal-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".dim_sucursales
(
  pk_sucursal BIGSERIAL
, version INTEGER
, date_from TIMESTAMP
, date_to TIMESTAMP
, store_id INTEGER
, "dirección 1" VARCHAR(50)
, "dirección 2" VARCHAR(50)
, district VARCHAR(20)
)
;CREATE INDEX idx_dim_sucursales_lookup ON "public".dim_sucursales(store_id)
;
CREATE INDEX idx_dim_sucursales_tk ON "public".dim_sucursales(pk_sucursal)
;

-------------------------------------------------------------------------------------------
-- Paso                : guardo alquiler-- Conexión de base de datos: postgres dwh-- SQL                  
CREATE TABLE "public".fact_alquiler
(
  "gancias por alquiler" DOUBLE PRECISION
, rental_id INTEGER
, rental_date TIMESTAMP
, film_id SMALLINT
, store_id SMALLINT
, last_update TIMESTAMP
, pk_pelicula INTEGER
, pk_sucursal INTEGER
, pk_clasificacion INTEGER
)
;
-------------------------------------------------------------------------------------------
-- Paso                : guardo_actuacion-- Conexión de base de datos: postgres dwh-- SQL                   
CREATE TABLE "public".fact_actuacion
(
  actor_id SMALLINT
, film_id SMALLINT
, last_update TIMESTAMP
, pk_pelicula INTEGER
, pk_actor INTEGER
)
;