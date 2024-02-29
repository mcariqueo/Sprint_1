##### SPRINT 1 #######
/*Objetivos: 
	-- Construir una base de dades relacional senzilla amb MySQL.
	-- Realitzar consultes senzilles.
	-- Realitzar operacions la base de dades MySQL.*/

/* Importar las bases de datos
	-- Importar a MySQL la base de datos transaction. 
    -- Esta Bd consta de dos tablas: company y transaction
    -- En el curso entregan dos documentos: la estructura de la tabla y el contenido de los datos */
# Exercici 1 
/* 	Mostra les característiques principals de l'esquema creat i 
	explica les diferents taules i variables que existeixen. 
	Assegura't d'incloure un diagrama que il·lustri la relació entre les diferents taules i variables.
*/

# VISUALIZAR LAS TABLAS
	SHOW tables FROM transactions;			# Mostrar todas las tablas
# Describe las caracteristicas de la tabla: 
	DESC 	company; 	DESC transaction;
	/* Comentarios:
    
    Tabla Company:
		La tabla company consiste en una tabla compuesta por 6 campos, el type nos indica el tipo de variable, 
		el valor entre parentesis indica el numero de bites permitidos, varchar significa "cadena de caracteres"
		La primary key a corresponde a id; 
		En todos los campos se ven valores nulos, probablemente es la ultima fila 
     
	Tabla transaction: 
		La tabla esta compuesta por 9 campos, el type nos indica el tipo de variable, el valor entre parentesis indica el numero de bites permitidos
		La primary key, es decir, .............., corresponde a id, este no es el mismo id de company
		Se indica con la palabra "MUL" la foreing key 
		En todos los campos se ven valores nulos, probablemente es la ultima fila*/

# Exercici 2
/* Realitza la següent consulta: Has d'obtenir el nom, email i país de cada companyia, 
   ordena les dades en funció del nom de les companyies */
SELECT		company_name AS Nom, 
			email, 
			country AS Pais_companyia
FROM 		transactions.company
ORDER BY 	company_name ASC; # ordeno en funcion del nombre de la compañia en orden alfabetico.

/* 

Para obtener esta respuesta, debemos transformar la información de la tabla #company#. 
Para ello utilizo la función select con los campos que solicitan
y con #order by# ordeno en orden alfabtico en funcion de los nombres de las compañias
*/

# Exercici 3
/* Des de la secció de màrqueting et sol·liciten que els passis un 
llistat dels països que estan fent compres.*/
SELECT 		company.country AS Listado_paises 		# Quiero el listado de paises
FROM		transactions.company					# obtenidos desde tabla company
JOIN 		transactions.transaction 				# Que esten contenidas en tabla transaction
ON 			company.id = transaction.company_id		# les sigo que se unen por este campo
GROUP BY 	company.country						# como realizo un count, necesito que agrupe por paises)
ORDER BY 	company.country ASC;					# ordeno por orden alfabetico

# Exercici 4
/* Des de màrqueting també volen saber des de quants països es realitzen les compres.*/
/* para esto debo utilizar el cordigo anterior y generar una subquery, 
con esto hago una tabla que será el from para un nuevo select*/
SELECT 		sum(contar_paises) AS Num_paises
FROM 
	(SELECT 	COUNT(DISTINCT company.country) AS contar_paises 
    FROM		transactions.company 
    JOIN 		transactions.transaction 
    ON 			company.id = transaction.company_id 
    GROUP BY 	company.country) AS count;
    
# Exercici 5
/* El teu cap identifica un error amb la companyia que té aneu 'b-2354'. Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest aneu.*/

SELECT		"b-2354" AS ID,
			company_name AS Nom, 
			country AS Pais_companyia
FROM 		transactions.company
WHERE		company.id = "b-2354";

# Exercici 6
/* A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana?*/
SELECT 		company.company_name 	AS Nombre_Companyia,
			AVG(transaction.amount) AS Despesa_mitjana	# Si pide mediana, se refiere al promedio
FROM		transactions.company					
JOIN 		transactions.transaction 				
ON 			company.id = transaction.company_id		
GROUP BY 	company.company_name					
ORDER BY 	AVG(transaction.amount) DESC
LIMIT 		1;   