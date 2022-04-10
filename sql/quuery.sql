-- 1 QUERY: selección de las 3 peliculas mas largas

select f.title as 'TITULO',
       f.length as 'DURACION'
from film f

order by f.length desc

limit 3;

-- 2 QUERY

select o.first_name as 'NOMBRE',
       count(o.first_name) as 'NUMERO PELICULAS'
from old_HDD o

group by o.first_name
order by count(o.first_name) desc

limit 5;

-- Parece que 'Unknown' es un actorazo. Ahora cogemos el de verdad

select o.first_name as 'NOMBRE',
       count(o.first_name) as 'NUMERO PELICULAS'
from old_HDD o

where o.first_name != 'Unknown'
group by o.first_name
order by count(o.first_name) desc

limit 5;

-- 3 QUERY: IDioma más repetido

select l.name as 'IDIOMA',
       count(f.language_id) as 'NUMERO DE PELICULAS'
from film f

left join language l
on f.language_id=l.language_id

order by count(f.language_id) desc

limit 5;

-- 4 QUERY: Películas con mayor numero de actores

select o.title as 'TITULO',
       count(o.title) as 'NUMERO DE ACTORES'
from old_HDD o

group by o.title
order by count(o.title) desc

limit 3;

-- 5 QUERY: Película que más veces se ha alquilado

select f.title as 'TITULO DE LA PELICULA',
       i.store_id as 'ID de la TIENDA',
       f.rental_duration as 'DURACION DEL ALQUILER'
from film f

left join inventory i
on i.film_id=f.film_id

order by f.rental_duration desc
limit 5;

-- 6 QUERY: Categorías de películas

select c.name as 'CATEGORIA',
       count(c.category_id) as 'NUMERO DE PELÍCULAS'
from old_HDD o

left join film f
on o.title = f.title

left join category c
on o.category_id = c.category_id

group by c.name
order by count(c.category_id) desc

limit 3;

-- 7 QUERY: Categoría en la que los actores han actuado más

select o.first_name as 'Nombre',
       c.name as 'CATEGORIA',
       count(c.name) as 'NUMERO DE PELÍCULAS'
from old_HDD o

left join actor a
on a.first_name = o.first_name

left join category c
on o.category_id = c.category_id

group by o.first_name, c.name
order by count(c.name) desc

limit 3;

-- 8 QUERY: Peliculas más dificiles de reemplazar

select o.title as 'PELICULA',
       max(f.replacement_cost) as 'COSTE DE SUSTITUCIÓN'
from old_HDD o

left join film f
on f.title = o.title

left join category c
on o.category_id = c.category_id

group by c.name
order by MAX(f.replacement_cost) desc

limit 3;

-- 9 QUERY: Categorias que mas cuestan reemplazar

select c.name as 'CATEGORÍA',
       sum(f.replacement_cost) as 'COSTE DE SUSTITUCIÓN'
from old_HDD o

left join film f
on f.title = o.title

left join category c
on o.category_id = c.category_id

group by c.name
order by MAX(f.replacement_cost) desc

limit 3;

-- 10 QUERY: Categorias con mejor rental rate

select c.name as 'CATEGORÍA',
       sum(f.rental_rate)/count(f.rental_rate) as 'VALORACION'
from old_HDD o

left join film f
on f.title = o.title

left join category c
on o.category_id = c.category_id

group by c.name
order by sum(f.rental_rate)/count(f.rental_rate) desc

limit 3;

