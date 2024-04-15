# Ejercicio
- **1)** Crea una base de datos llamada EmpresaDevJav
- **2)** Crea 2 tablas e ingresa por lo menos 5 registros.
- **3)** Realiza las siguientes consultas:
  - **a.** Obtener los nombres de los empleados.
  - **b.** Mostrar los datos completos de los departamentos.
  - **c.** Obtener los datos de empleados con cargo ____________.
  - **d.** Mostrar la cantidad de empleados registrados.
  - **e.** Sacar un promedio de salarios de empleados.
  - **f.** Lista los nombres de los departamentos ordenados por ciudad.
  - **g.** Muestra un listado de salarios y comisiones de los empleados del departamento _________.
  - **h.** Calcular el valor a pagar a cada empleado si se realiza un incremento del 25% en su salario más una bonificación de $20000, muestre una columna con el salario actual,   otra con el incremento y otra con la suma de todo.
  - **i.** Editar el salario realizando el incremento del punto anterior.
  - **j.** Modificar la ciudad _____ a la nueva ciudad _________.
  - **k.** Hallar el salario del empleado con identificación ________.
  - **l.** Muestre empleados donde el nombre empiece con la letra A.
  - **m.** Liste los empleados que no tienen comisión.
  - **n.** Muestre los empleados cuyo sueldo supere _____ y que correspondan al departamento _______.
  - **o.** Obtener el salario más alto y quien lo recibe.
  - **p.** El empleado _____ renunció, vamos a eliminar su registro.
> Nota: Escribe cada sentencia que usaste.

# Sentencias

### Generales
```
CREATE DATABASE <nombre de la base de datos>;
USE <nombre de la base de datos>;
CREATE TABLE <nombre de la tabla>;
INSERT INTO <nombre de la tabla> VALUES ();
SELECT <nombre del campo> AS "<nombre referencial>" FROM <nombre de la tabla>;
SELECT *FROM <nombre de la tabla>;
SELECT *FROM <nombre de la tabla> WHERE <nombre del campo> LIKE "<dato>%";
SELECT COUNT(*) AS "<nombre referencial>" FROM <nombre de la tabla>;
SELECT AVG(<nombre del campo>) AS "<nombre referencial>" FROM <nombre de la tabla>;
SELECT *FROM <nombre de la tabla> ORDER BY <nombre del campo>;
UPDATE <nombre de la tabla> SET <nombre del campo> = "<dato nuevo>" WHERE <condición>;
SELECT <nombre del campo> AS "<nombre referencial>" FROM <nombre de la tabla> WHERE <condición>;
SELECT *FROM <nombre de la tabla> WHERE <nombre del campo> LIKE "<dato>%";
SELECT *FROM <nombre de la tabla> WHERE <nombre del campo> = <condición>;
SELECT *FROM <nombre de la tabla> WHERE (<condición 1>) AND (<condición 2>);
SELECT <nombre de la tabla> AS "<nombre referencial>" FROM <nombre de la tabla> WHERE <nombre de la tabla> = (SELECT MAX(<nombre de la tabla>) FROM <nombre de la tabla>);
DELETE FROM <nombre de la tabla> WHERE <nombre de la tabla> = <condición>;
```

### Consulta
```
SHOW DATABASES;
SHOW TABLES;
DESCRIBE <nombre de la tabla>;
SELECT *FROM <nombre de la tabla>;
```

### Funciones
```
COUNT()
AVG()
MAX()
```
