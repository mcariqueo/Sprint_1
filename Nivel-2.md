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

      SELECT 	DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
			amount As Monto,
			declined 
      FROM		transaction
      WHERE		declined !=1
      ORDER BY	amount DESC
      limit 5;









