#	(1) CREA UNA BASE DE DATOS LLAMADA EmpresaDevJav
CREATE DATABASE EmpresaDevJav;
USE EmpresaDevJav;

#	(2) CREA 2 TABLAS E INGRESA POR LO MENOS 5 REGISTROS
CREATE TABLE Empleados (
	codigo_emp INT(8) UNSIGNED, #CÓDIGO REFERENCIAL DEL EMPLEADO A CARGO
    nombre_emp VARCHAR(30) NOT NULL, #NOMBRE REGISTRAL DEL EMPLEADO
    sexo_emp CHAR(1), #SEXO REGISTRAL DEL EMPLEADO (F|M|O)
    nacimiento_emp DATE DEFAULT NULL, #FECHA DE NACIMIENTO DEL EMPLEADO (0000-00-00)
    ingreso_emp DATE, #FECHA DE INGRESO DEL EMPLEADO (0000-00-00)
    sueldo_emp FLOAT, #MONTO SALARIAL DEL EMPLEADO
    comis_emp FLOAT, #MONTO DE COMISIÓN POR EMPLEADO
    cargo_emp VARCHAR(30), #CARGO EN LA EMPRESA DEL EMPLEADO
    numero_depto INT(4) UNSIGNED, #NUMERO DEL DEPARTAMENTO DONDE TRABAJA
    PRIMARY KEY (codigo_emp)
	);

INSERT INTO Empleados () VALUES
	(31840269, "Rosa Angulo", "F", "1957-03-15", "2022-08-16", 725000, 0, "Directora de Recursos Humanos", 4372),
    (71294658, "Juan Pérez", "M", "1985-11-22", "2023-05-10", 620000, 35000, "Analista de Recursos Humanos", 4372),
    (89437215, "María Torres", "O", "1990-07-09", "2024-02-28", 530000, 45000, "Ingeniera de Software", 7539),
    (22739472, "Raul González", "M", "1978-04-18", "2022-11-20", 710000, 0, "Director Financiero", 1984),
    (45981236, "Carolina Ramírez", "F", "1982-09-30", "2023-08-15", 580000, 38000, "Diseñadora Gráfica", 8736);

CREATE TABLE Departamentos (
	codigo_dpto INT(4) UNSIGNED, #CÓDIGO REFERENCIAL DEL DEPARTAMENTO
    nombre_dpto VARCHAR(30), #NOMBRE DEL DEPARTAMENTO
    ciudad_dpto VARCHAR(40), #CIUDAD DONDE SE ENCUENTRA EL DEPARTAMENTO
    director_dpto INT(8) UNSIGNED, #CÓDIGO REFERENCIAL DEL EMPLEADO A CARGO
    PRIMARY KEY (codigo_dpto),
    FOREIGN KEY (director_dpto) REFERENCES Empleados(codigo_emp)
	);

INSERT INTO Departamentos () VALUES
	(4372, "Recursos Humanos", "La Plata", 31840269),
	(8736, "Administración", "La Plata", null),
    (1984, "Finanzas", "Ciudad Autónoma de Buenos Aires", 22739472),
    (8302, "Producción", "Berazategui", null),
    (7539, "Sistemas", "Mar del Plata", null);

#	(3) RELIZA LAS SIGUIENTES CONSULTAS
#	a. OBTENER LOS NOMBRES DE LOS EMPLEADOS
SELECT nombre_emp AS "Empleados" FROM Empleados;

#	b. MOSTRAR LOS DATOS COMPLETOS DE LOS DEPARTAMENTOS
SELECT *FROM Departamentos;

#	c. OBTENER LOS DATOS DE EMPLEADOS CON CARGO "DIRECTIVO"
SELECT *FROM Empleados WHERE cargo_emp LIKE "Director%";

#	d. MOSTRAR LA CANTIDAD DE EMPLEADOS REGISTRADOS
SELECT COUNT(*) AS "Empleados registrados" FROM Empleados;

#	e. SACAR UN PROMEDIO DE SALARIOS DE EMPLEADOS
SELECT AVG(sueldo_emp) AS "Promedio salarial" FROM Empleados;

#	f. LISTA LOS NOMBRES DE LOS DEPARTAMENTOS ORDENADOS POR CIUDAD
SELECT *FROM Departamentos ORDER BY ciudad_dpto;

#	g. MUESTRA UN LISTADO DE SALARIOS Y COMISIONES DE LOS EMPLEADOS DE "RECURSOS HUMANOS" (4372)
SELECT sueldo_emp AS "Salario RRHH", comis_emp AS "Comisiones RRHH" FROM Empleados WHERE numero_depto = 4372;

#	h. CALCULAR EL VALOR A PAGAR A CADA EMPLEADO SI SE REALIZA UN INCREMENTO DEL 25% + UNA BONIFICACIÓN DE $200000
SELECT  sueldo_emp AS "Sueldo actual",
		(sueldo_emp*0.25) AS "Incremento",
		(sueldo_emp + sueldo_emp*0.25 + 200000) AS "Total + Bonificación" FROM Empleados;

#	i. EDITAR EL SALARIO REALIZANDO EL INCREMENTO DEL PUNTO ANTERIOR
UPDATE Empleados SET sueldo_emp = (sueldo_emp + sueldo_emp*0.25 + 200000) WHERE sueldo_emp IS NOT NULL;

#	j. MODIFICAR LA CIUDAD "CABA" POR "LA PLATA"
UPDATE Departamentos SET ciudad_dpto = "La Plata" WHERE ciudad_dpto = "Ciudad Autónoma de Buenos Aires";

#	k. HALLAR EL SALARIO DEL EMPLEADO CON IDENTIFICACIÓN "89437215"
SELECT sueldo_emp AS "Sueldo del agente 89437215" FROM Empleados WHERE codigo_emp = 89437215;

#	l. MUESTRE EMPLEADOS DONDE EL NOMBRE EMPIECE CON LA LETRA "R"
SELECT *FROM Empleados WHERE nombre_emp LIKE "R%";

#	m. LISTE LOS EMPLEADOS QUE NO TIENEN COMISIÓN
SELECT *FROM Empleados WHERE comis_emp = 0;

#	n. MUESTRE LOS EMPLEADOS CUYO SUELDO SUPERE LOS "600000" Y QUE CORRESPONDAN AL DEPARTAMENTO DE "FINANZAS" (1984)
SELECT *FROM Empleados WHERE (sueldo_emp > 600000) AND (numero_depto = 1984);

#	o. OBTENER EL SALARIO MÁS ALTO Y QUIÉN LO RECIBE
SELECT nombre_emp AS "Empleado", sueldo_emp AS "Sueldo" FROM Empleados WHERE sueldo_emp = (SELECT MAX(sueldo_emp) FROM Empleados);

#	p. EL EMPLEADO "45981236" RENUNCIÓ, HAY QUE ELIMINAR SU REGISTRO
DELETE FROM Empleados WHERE codigo_emp = 45981236;