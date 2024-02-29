## Exercici 1

El teu cap està redactant un informe de tancament de l'any i et sol·licita que li enviïs informació rellevant per al document. 
Per a això et sol·licita verificar si en la base de dades existeixen companyies amb identificadors (aneu) duplicats.

En este caso, debo generar un consulta en la tabla _**company**_ buscando duplicados. Podria en primer lugar:

      SELECT DISTINCT * FROM transactions.company

En este caso, podemos verificar la cantidad de filas en el output. Con el ccomando "*" hacemos la consulta general. Esto mismo lo podemos hacer los id

En una tabla podemos observar que:

| Comando                                                     | num_fil |
|-------------------------------------------------------------|---------|
| SELECT DISTINCT * FROM transactions.company;                | 100     |
| SELECT DISTINCT id FROM transactions.company;               | 100     |
| SELECT DISTINCT company_name FROM transactions.company;     | 100     |
| SELECT DISTINCT phone FROM transactions.company;            | 100     |
| SELECT DISTINCT email FROM transactions.company;            | 100     |
| SELECT DISTINCT country FROM transactions.company;          | 15      |
| SELECT DISTINCT website FROM transactions.company;          | 75      |


Esto nos indica que , si bien, no hay _**id**_ repetidos, si hay _**website**_ repetido. En el caso de _**country**_ no llama la atención, debido a que es esperable que se repitan paises.

Respuesta: No hay _**Id**_ s repetidos

## Exercici 2
En quin dia es van realitzar les cinc vendes més costoses? 

Mostra la data de la transacció i la sumatòria de la quantitat de diners.

En primerr lugar, o que hago es seleccionar las 5 primeras transacciones en orden descendente en funcion del _**amount**_, esto se obtiene mediente

	SELECT 	 DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
		 amount As Monto,
		 declined 
	FROM	 transaction
	WHERE	 declined !=1
	ORDER BY amount DESC
	limit 	 5;

esto nos entrega el siguiente output: 
| Fecha    | Monto      |
|----------|------------|
|2021-06-21|	499.23	|
|2021-08-17|	497.84	|
|2021-08-21|	494.82	|
|2021-08-28|	494.17	|
|2022-01-31|	492.42	|

	SELECT 	sum(monto) as total
	FROM 	
		(SELECT 	DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
				amount As Monto,
				declined 
		FROM		transaction
		WHERE		declined !=1
		ORDER BY	amount DESC
    		limit 		5) 
    		AS max_transaciones

El output es 
|TOTAL  |
|-------|
|2478.48|


## Exercici 3
En quin dia es van realitzar les cinc vendes de menor valor? Mostra la data de la transacció i la sumatòria de la quantitat de diners.

Me baso en el ejercico anterior para obtener las 5 transacciones mas bajas esto se obtiene mediante:

	SELECT 	sum(monto) as total
	FROM 	
		(SELECT 	DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
				amount As Monto,
				declined 
		FROM		transaction
		WHERE		declined !=1
		ORDER BY	amount DESC
    		limit 		5) 
    		AS min_transaciones

|Total|
|-----|
|85.41|


# Exercici 4
Quina és la mitjana de despesa per país?

Presenta els resultats ordenats de major a menor mitjà.

	SELECT 		company.country 			AS Pais,
           		ROUND(AVG(transaction.amount),2)	AS Gasto_promedio
	FROM		transactions.company
	JOIN		transactions.transaction 
	ON		company.id = transaction.company_id
	group by 	company.country
	order by	avg(transaction.amount)

En este caso, mediante el comando _**ROUND**_ redondeo el numero a dos decimales para una mejor visualización. 

En el caso de _**order by**_ por defecto genera un orden de mayor a menor.

EL output es el siguiente: 

| Pais | Despesa_mitja |
|------|------|
|	United States	|	309.18	|
|	Ireland	|	277.31	|
|	United Kingdom	|	270.73	|
|	Canada	|	269.65	|
|	Sweden	|	260.62	|
|	Norway	|	254.22	|
|	Netherlands	|	253.02	|
|	Germany	|	244.20	|
|	Australia	|	232.05	|
|	Belgium	|	228.15	|
|	China	|	227.56	|
|	New Zealand	|	222.28	|
|	Italy	|	201.59	|
|	France	|	179.20	|
|	Spain	|	53.40	|







