# Exercici 1
Mostra les característiques principals de l'esquema creat i explica les diferents taules i variables que existeixen. Assegura't d'incloure un diagrama que il·lustri la relació entre les diferents taules i variables.

### Descripcion de la base de datos
El comando _**DESCRIBE**_ se usa para obtener información sobre la estructura de una tabla específica
   - _**DESCRIBE company**_ para obtener información sobre la estructura de la tabla llamada "company".
   - _**DESCRIBE transaction**_ para obtener información sobre la estructura de la tabla llamada "transaction".
   
Estos comandos proporcionan detalles sobre los campos de ambas tablas, los tipos de datos de los campos, las primary y foreing key. En el caso de la tabla company, dado que es una tabla de    dimensiones tenemos solo primary key. 
### Tipos de tablas
Esta base de datos consta de dos componentes principales:
   1. Tabla de dimensiones: _**company**_
      
      Contiene 6 campos, todos ellos de tipo string.
      Funciona como una tabla de dimensiones, donde cada fila describe una compañía con información relacionada con contacto, teléfono, ubicación y sitio web.
   
   3. Tabla de hechos: _**transaction**_
   
      Contiene 9 campos con formatos que incluyen interger, fechas y caracteres. Esta tabla registra informacion de tallada sonbre las transacciones realizadas.
### Relacion entre tablas
En la figura se muestra el diagrama de ambas tablas, en la que se observa la relacion de 1:n entre la tabla company y la tabla transaction. La prymary key es company.id
   ![Logo de GitHub](https://github.com/mcariqueo/DataAnalytics_Sprint-1/blob/main/Relacion_tablas.png)
   

### Interpretación de la tabla

En el contexto de esta base de datos, la tabla "transaction" representa los eventos o acciones específicas que ocurren, mientras que la tabla "company" proporciona información estática sobre las compañías involucradas en estas transacciones.

Cada fila en la tabla "transaction" está asociada con un ID que corresponde a una transacción específica de una compañía específica, la cual está descrita en la tabla "company".

# Exercici 2
Realitza la següent consulta: Has d'obtenir el nom, email i país de cada companyia, ordena les dades en funció del nom de les companyies

	SELECT 	company_name AS Nom, 
 		email, 
   		country AS Pais_companyia
	FROM 	transactions.company
	ORDER BY company_name ASC; 

Para obtener esta respuesta, debemos transformar la información de la tabla _**company**_, Para ello utilizo la función _**select**_ con los campos que solicitan y con _**order by**_ ordeno de manera alfabetica en funcion de los nombres de las compañias.

Para este ejercicio el output de la tabla es de 100 filas. A continuación muestro el formato de las primeras filas: 
| Nombre Compañia | email     | Pais    |
|-----------------|-----------|--------|
|A Institute|	metus.aliquam@google.edu|	Belgium|
|Ac Fermentum Incorporated|	donec.porttitor.tellus@yahoo.net|	Germany|
|Ac Industries|	ipsum@yahoo.com	|Germany|
|Ac Libero Inc.|	mollis.lectus@protonmail.ca|	United Kingdom
|Aliquam Erat Volutpat LLP	|pede.nunc@icloud.net	|Italy|
|Aliquam Iaculis Lacus Corp.|	dictum@aol.org	|Belgium|
|Aliquam PC|	scelerisque.mollis@icloud.org	|Germany|
|Aliquet Diam Limited	|eu.eros.nam@icloud.org|	United States|

# Exercici 3
Des de la secció de màrqueting et sol·liciten que els passis un llistat dels països que estan fent compres.

	SELECT 		company.country AS Listado_paises 		# Quiero el listado de paises
	FROM		transactions.company				# obtenidos desde tabla company
	JOIN 		transactions.transaction 			# Que esten contenidas en tabla transaction
	ON 		company.id = transaction.company_id		# les sigo que se unen por este campo
	GROUP BY 	company.country					# como realizo un count, necesito que agrupe por paises)
	ORDER BY 	company.country ASC;				# ordeno por orden alfabetico

En este caso nos genera una tabla con 15 filas, que corresponden a los 15 paises. Este código creará una tabla con una columna llamada "Listado_paises" con los paises que tienes datos de compra en la tabla **transaction**: 

| País          |
|---------------|
| Australia     |
| Belgium       |
| Canada        |
| China         |
| France        |
| Germany       |
| Ireland       |
| Italy         |
| Netherlands   |
| New Zealand   |
| Norway        |
| Spain         |
| Sweden        |
| United Kingdom|
| United States |

# Exercici 4
Des de màrqueting també volen saber des de quants països es realitzen les compres.

Para esto debo utilizar el cordigo anterior y generar una subquery, con esto hago una tabla que será el from para un nuevo select

	SELECT 		sum(contar_paises) AS Num_paises			
	FROM 
	(	SELECT COUNT	(DISTINCT company.country) AS contar_paises 
    		FROM		transactions.company 
    		JOIN 		transactions.transaction 
   		ON 		company.id = transaction.company_id 
    		GROUP BY 	company.country) AS count;

En este caso, el resultado output muestra una tabla que entrega la suma de los paises que tienen datos en la tabla **transaction**

| Num_paises |
|------------|
|15|
    
# Exercici 5

El teu cap identifica un error amb la companyia que té aneu 'b-2354'. Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest aneu.

	SELECT		"b-2354" AS ID,
			company_name AS Nom, 
			country AS Pais_companyia
	FROM 		transactions.company
	WHERE		company.id = "b-2354";

Para esto extraigo la informacion desde la tabla **company**, y a traves del comando _**WHERE**_ busco el id de la compañia. El output de este codigo muestra:
|ID     | Nom            | Pais Compañia |
|-------|----------------|---------------|
|b-2354 | Ac Libero Inc. | United Kingdom|
 

# Exercici 6

A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana?

	SELECT 		company.company_name 	AS Nombre_Companyia,
			AVG(transaction.amount) AS Despesa_mitjana	# Si pide mediana, se refiere al promedio
	FROM		transactions.company					
	JOIN 		transactions.transaction 				
	ON 		company.id = transaction.company_id		
	GROUP BY 	company.company_name					
	ORDER BY 	AVG(transaction.amount) DESC
	LIMIT 		1;   

En este caso, considearamos que al solicitar la despesa mitjana se refiere a la despesa promedio. Por ello utilizo una funcion de promerido _**AVG**_. Como nos solicitan el la compañia con mayor despesa, puedo ordenarlos a traves de un _**order by**_ de mayor a menor (_**DESC**_) y obtener el _**LIMIT**_ 1.

El output es el siguiente: 

| Nombre Companyia | Despesa mitjana| 
|------------------|----------------|
|Eget Ipsum Ltd    |    473.075000  |


