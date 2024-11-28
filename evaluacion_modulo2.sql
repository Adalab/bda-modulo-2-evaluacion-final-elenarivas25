use sakila;

-- EJERCICIO 1: Selecciona todos los nombres de las películas sin que aparezcan duplicados.
-- Necesitamos el titulo (title) de todas las películas, como pide que no estén duplicados usamos DISTINCT, la tabla que usamos en este caso es film.

SELECT
DISTINCT (title)
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

SELECT 
DISTINCT (first_name)
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

-- EJERCICIO 9: Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
-- Tenemos que encontrar y mostrar la cantidad total de películas, COUNT(film_id), en cada clasificación para lo que hacemos GROUP BY rating, dentro de la tabla film.

SELECT 
COUNT(DISTINCT(film_id)) AS NumPorClasificacion, 
rating
FROM film
GROUP BY rating;

-- EJERCICIO 10: Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
-- nombre y apellido junto con la cantidad de películas alquiladas.
-- Para este ejercicio necesitamos usar dos tablas, customer y rental, por lo que hago uso del INNER JOIN, estas dos tablas están relacionadas por customer_id.
-- Nos están pidiendo mostrar el customer_id, first_name, last_name y encontrar y mostrar la cantidad de peliculas alquiladas, COUNT(rental_id), por cada cliente, GROUP BY customer_id.


SELECT 
c.customer_id, 
c.first_name, 
c.last_name, 
COUNT(DISTINCT r.rental_id) AS TotalPelisAlquiladas
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- EJERCICIO 11: Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres. 
-- En este caso nos pide mostar el nombre, name, de la categoria, junto con el recuento de alquileres, COUNT(rental_id), por categoria por lo que uso GROUP BY category_id.
-- He optado por usar INNER JOIN para acceder a las diferentes tablas, ya que se necesita acceder al rental_id de la tabla rental, a category_id y name de la tabla category que no están comunicadas directamente.

SELECT 
c.name, 
COUNT(DISTINCT (r.rental_id)) AS PelisPorClasificacion
FROM rental AS r
INNER JOIN inventory AS i
ON r.inventory_id = i.inventory_id
INNER JOIN film_category AS fc
ON i.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.category_id;

-- EJERCICIO 12: Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
-- Para encontrar el promedio de duración accedemos a la tabla film y usamos AVG(length) y los agrupamos GROUP BY rating, y mostramos el promedio 
-- junto con la clasificación, rating.

SELECT 
rating, 
AVG(length) AS DuracionMedia
FROM film
GROUP BY rating;


-- EJERCICIO 13: Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
-- Buscamos el nombre (first_name) y apellido (last_name) que aparecen en la tabla actor, 
-- de los actores que aparecen en la pelicula Indian Love, es decir que el title de la tabla film sea Indian Love, para lo que usamos WHERE.
-- Para esto uso INNER JOIN ya que la tabla actor y la tabla film se unen a través de la tabla film_actor y el actor_id y el film_id.


SELECT
a.first_name, 
a.last_name
FROM actor AS a
INNER JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
INNER JOIN film AS f
ON fa.film_id = f.film_id
WHERE f.title = "Indian Love";

-- EJERCICIO 14: Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
-- Necesitamos el título (title) de la tabla film donde la condición, WHERE, es que aparezcan las palabras dog o cat en su descripcion, para lo que uso LIKE %dog% OR LIKE %cat%.

SELECT
title,
description
FROM film
WHERE description LIKE "%dog%" OR description LIKE "%cat%";

-- EJERCICIO 15: Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
-- Estamos buscando el título (title) de la tabla film donde la condición WHERE, es que fueran lanzadas, release_year, entre los años 2005 y 2010 para lo que uso BETWEEN.

SELECT 
title,
release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

-- EJERCICIO 16: Encuentra el título de todas las películas que son de la misma categoría que "Family".
-- Mostramos el tÍtulo (title) de la tabla film, de todas las películas que son de la categoría, name, Family de la tabla category_id, para lo que usamos WHERE.
-- Estamos usando INNER JOIN ya que necesitamos información tanto de la tabla film como de la tabla category y como no están unidas directamente usamos la tabla film_category que las une.

SELECT 
title
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id
WHERE name = "Family";

-- Usando subquery:

SELECT title 
 FROM film
 WHERE film_id IN (
	 SELECT film_id
     FROM film_category
	      WHERE category_id IN(
			SELECT category_id
			FROM category
          WHERE name = "Family"));
          
-- EJERCICIO 17: Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
-- Aquí necesitamos el title de la tabla film, y las condiciones son que las películas pertenecen a la clasificación R
-- y que duren más de 2 horas (120 minutos), para lo que usamos WHERE...AND.

 SELECT 
 title,
 rating,
 length
 FROM film
 WHERE rating = "R" AND length > 120;
 
 
                                   --  BONUS --


-- EJERCICIO 18: Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
-- Necesitamos first_name y last_name de la tabla actor.
-- Como pide que aparezcan en más de 10 películas usamos INNER JOIN con el actor_id de la tabla film_actor, para unir ambas tablas.
-- Agrupamos por GROUP BY actor_id para saber qué actores aparecen en más de 10 películas, usando para esto HAVING(ya que es un filtro de grupo y se usa para funciones agragadas) COUNT del film_id, y que sea mayor (>) a 10.
 
SELECT 
first_name, 
last_name
FROM actor AS a
INNER JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 10;

-- EJERCICIO 19: Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
-- Opción 1:  muestro el actor_id y el film_id de la tabla film_actor donde el film_id es NULL. No hay ningún registro.

SELECT actor_id, 
film_id
FROM film_actor
WHERE film_id IS NULL;

-- Opción 2: --
-- Elijo mostrar el actor_id ya que es único para cada actor, de la tabla film_actor, y el film_id que es único para cada pelicula, y aparece en las tablas film_actor y film.
-- Como pide que no aparezca en ninguna pelicula usaré LEFT JOIN que no elimina cuando los registros son NULL.
-- La condición que usaré será WHERE...IS NULL.
-- En este caso no hay ningún actor o actriz que no aparezca en ninguna película.

SELECT 
actor_id, 
fc.film_id 
FROM film_actor AS fc
LEFT JOIN film AS f
ON fc.film_id = f.film_id
WHERE fc.film_id IS NULL;

-- Opción 3: Para esta opción elijo mostrar first_name y last_name de la tabla actor, hacemos una subconsulta en la que buscamos que el actor_id no esté en la tabla film_id.

SELECT 
first_name, 
last_name
FROM actor
WHERE actor_id NOT IN(
      SELECT actor_id
      FROM film_actor);
      
-- EJERCICIO 20: Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
 -- Necestiamos mostrar el name de la categoria y el promedio de la duración, para esto usamos AVG(length).
 -- La duración la tenemos en la tabla film, mientras que la categoría está en la tabla category, para lo que usamos INNER JOIN 
 -- para unir estas tablas, pero necesitamos un INNER JOIN intermedio ya que estas dos tablas no se comunican directamente, y lo hacen por medio de la tabla film_category.
 -- Agrupamos con GROUP BY por la categoría, name, para poder mostrar solo las películas que tienen un promedio superior a 120 minutos, usando HAVING.

SELECT 
name, 
AVG(length) AS DuracionMedia
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY
name
HAVING AVG(length) > 120;

-- EJERCICIO 21: Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
-- Necesitamos mostar el nombre (first_name) de la tabla actor, y la cantidad COUNT(film_id) de películas en las que han actuado estos actores de la tabla film_actor.
-- Para ello usamos INNER JOIN, para unir la tabla actor y film_actor y agrupamos, GROUP BY, por el actor_id para saber que actores han participado en 5 o más peliculas (>=), usando HAVING.

SELECT 
first_name,
last_name,
COUNT(DISTINCT(fa.film_id)) AS NumeroPeliculas
FROM actor AS a
INNER JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(DISTINCT(fa.film_id)) >= 5;

-- EJERCICIO 22: Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar
-- los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes. 

-- Primero veo como saber la diferencia entre dos fechas, para eso uso DATEDIFF, y además uso la condición WHERE es que hayan sido alquiladas por más de 5 días.

SELECT rental_id, 
DATEDIFF(return_date, rental_date) AS Dias
FROM rental 
WHERE DATEDIFF(return_date, rental_date) > 5;

-- Despues usando un INNER JOIN relaciono las tablas inventory y rental.

SELECT 
i.film_id, 
r.rental_id
FROM inventory AS i
INNER JOIN rental AS r
ON i.inventory_id = r.inventory_id
WHERE DATEDIFF(return_date, rental_date) >5;

-- Realizo dos subconsultas--

SELECT 
title
FROM film
WHERE film_id IN (
      SELECT 
      film_id
      FROM inventory
      WHERE inventory_id IN (
           SELECT
           inventory_id
           FROM rental 
           WHERE DATEDIFf(return_date, rental_date) > 5));


-- EJERCICIO 23: Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
-- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores

SELECT 
first_name, 
last_name
FROM actor
WHERE actor_id NOT IN (
      SELECT actor_id
      FROM film_actor
      WHERE film_id IN(
            SELECT film_id
            FROM film_category
            WHERE category_id IN (
                  SELECT category_id
                  FROM category
                  WHERE name = "Horror")));

 -- Con tres subconsultas. 
 -- Seleccionamos nombre y apellidos de la tabla de actores.
 -- Usando WHERE NOT IN, nos aseguramos de excluir a los actores que no han participado en ninguna película de Horror.
 -- Utilizamos a parte de la subconsulta NOT IN, dos consultas más para relacionar la tabla actor con la tabla category 
 -- en la que podemos encontrar el nombre de la categoría Horror.
 
SELECT 
first_name, 
last_name
FROM actor
WHERE actor_id NOT IN (
      SELECT actor_id
      FROM film_actor
      WHERE film_id IN(
            SELECT film_id
            FROM film_category
            WHERE category_id IN (
                  SELECT category_id
                  FROM category
                  WHERE name = "Horror")));

-- EJERCICIO 24: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
-- Seleccionamos el titulo de la tabla film y usamos dos subconsultas para relacionar la tabla film con la tabla category 
-- y complir las condiciones de que las películas sean del genero Comedia y duren más de 180 minutos

SELECT  
title
FROM film
WHERE film_id IN (
      SELECT film_id
      FROM film_category
      WHERE category_id IN(
            SELECT category_id
            FROM category 
            WHERE name = "Comedy" AND length > 180));
            
-- EJERCICIO 25: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.
            
