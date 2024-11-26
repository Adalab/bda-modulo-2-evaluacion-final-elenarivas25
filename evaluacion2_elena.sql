use sakila;
-- EJERCICIO 1: Selecciona todos los nombres de las películas sin que aparezcan duplicados.
-- Necesitamos el titulo (title) de todas las películas, como pide que no estén duplicados usamos DISTINCT, la tabla que usamos en este caso es film.

SELECT
DISTINCT title
FROM film;

-- EJERCICIO 2: Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
-- Necesitamos los nombres de todas las películas, title, de la tabla film, en la cual su clasficiación (rating) tenga una condicion que es
-- que sea igual a PG-13, por lo que usamos WHERE.

SELECT 
title
FROM film
WHERE rating = "PG-13";

-- EJERCICIO 3: Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
-- En este caso nos pide el titulo (title) y la descripción (description) de la tabla film, con la condición de que en la descripcion 
-- aparezca la palabra "amazing", por lo que usamos WHERE...LIKE, y al decir que aparezca usamos %amazing%.

SELECT 
title, 
description
FROM film
WHERE description LIKE "%amazing%";

-- EJERCICIO 4: Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
-- Estamos buscando el titulo de todas las peliculas y en este caso la condición es que tengan una duración mayor a 120 minutos, 
-- para lo que usamos WHERE con la colulmna longitud(length) y el comparativo > mayor que.

SELECT 
title,
length
FROM film
WHERE length > 120;

-- EJERCICIO 5: Recupera los nombres de todos los actores.
-- En este caso pide el nombre de todos los actores para lo que usamos first_name (nombre), en este caso uso DISTINCT para que no se repitan los nombres
-- y usamos la tabla actor.

SELECT DISTINCT 
first_name
FROM actor; 

-- EJERCICIO 6: Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
-- Estamos buscando el nombre (first_name) y el apellido (last_name) de la tabla actor, y la condición es que tenga la palabra "Gibson" en su apellido.
-- En la primera opción para la condición uso WHERE ... = "Gibson", ya que entiendo que el apellido es Gibson

SELECT 
first_name,
last_name
FROM actor
WHERE last_name = "Gibson";


-- EJERCICIO 7: Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
-- Estamos buscando el nombre (first_name) de la tabla actor, donde el actor_id tenga una condición, WHERE
-- que es que esté entre 10 y 20 para ello usamos BETWEEN.

SELECT 
first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- EJERCICIO 8: Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
-- Buscamos el titulo (title) de la tabla film, en la que la condición sea que su clasificación (rating) no sea ni 'R' ni 'PG-13', para lo que usamos WHERE...NOT IN.

SELECT 
title
FROM film
WHERE rating NOT IN ( "R" , "PG-13");