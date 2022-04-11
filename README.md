# CREACIÓN DE BASE DE DATOS EN MYSQL

## 1.- PROCEDIMIENTO
El procedimiento que se ha seguido para e desarrollo de la base datos se pueden resumir en los siguientes pasos:

**1.1.-** Importación de las tablas que van a conformar nuestra base de datos (son archivos .csv).

**1.2.-** Limpieza de los datos que contiene, pues dentro de estos pueden existir elementos que hacen que la base de datos pueda llegar a ser inconsistente.

**1.3.-** Exportación de los datos una vez han sido tratados (en mi caso estos han sido sobreescritos).

**1.4.-** Realización del esquema que conformará la base de datos.

**1.5.-** Realización de las querys con la que queremos obtener resultados.

**1.6.-** Obtención de resultados.
	
## 2.- LIMPIEZA DE LOS DATOS
En primer lugar, como el único dataframe con columnas nulas es 'film', entonces se elimina esa columna llena de nulos, pues no aporta información alguna a la tabla.

Para aportarle más consistencia al modelo que se va a seguir para la construcción de la tabla se añade la categoría 0 (que hará el papel de categoría deconocida).

La tabla en la que se harán el mayor número de cambios es en la de old_HDD, pues esta hace de intermediario entre film y actor (pues estas establecen una relación many to many).

En la otra tabla en la que se harán cambios será en rental, pues los inventory_id tienen números mayores que 1000, mientras que en en inventory son siempre inferiores y por ello es necesario hacer este ajuste.
	
## 3.- MATERIAL Y BIBLIOTECAS UTILIZADOS
- Biblioteca Pandas

- Workbench 
