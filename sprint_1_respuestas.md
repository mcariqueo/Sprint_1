# Sprint 1 - Nivel 1

## Exercici 1
Mostra les característiques principals de l'esquema creat i explica les diferents taules i variables que existeixen. Assegura't d'incloure un diagrama que il·lustri la relació entre les diferents taules i variables.

### Descripcion de la base de datos

El comando _**DESCRIBE**_ se usa para obtener información sobre la estructura de una tabla específica

   - _**DESCRIBE company**_ para obtener información sobre la estructura de la tabla llamada "company".
   - _**DESCRIBE transaction**_ para obtener información sobre la estructura de la tabla llamada "transaction".
   
Estos comandos proporcionan detalles sobre los campos de ambas tablas, los tipos de datos de los campos, las primary y foreing key. En el caso de la tabla company, dado que es una tabla de    dimensiones tenemos solo primary key. 

### Tabla de dimensiones y hechos

Esta base de datos consta de dos componentes principales:
1. Tabla de dimensiones: _**company**_
      
    Contiene 6 campos, todos ellos de tipo string.
    Funciona como una tabla de dimensiones, donde cada fila describe una compañía con información relacionada con contacto, teléfono, ubicación y sitio web.
   
3. Tabla de hechos: _**transaction**_
   
    Contiene 9 campos con formatos que incluyen interger, fechas y caracteres. Esta tabla registra informacion de tallada sonbre las transacciones realizadas.

### Relacion entre tablas

En la figura se muestra el diagrama de ambas tablas, en la que se observa la relacion de 1:n entre la tabla company y la tabla transaction. La prymary key es company.id
![](files_s1/S1N1E1a.png)
   

### Interpretación de la tabla

En el contexto de esta base de datos, la tabla "transaction" representa los eventos o acciones específicas que ocurren, mientras que la tabla "company" proporciona información estática sobre las compañías involucradas en estas transacciones.

Cada fila en la tabla "transaction" está asociada con un ID que corresponde a una transacción específica de una compañía específica, la cual está descrita en la tabla "company".

## Exercici 2

Realitza la següent consulta: Has d'obtenir el nom, email i país de cada companyia, ordena les dades en funció del nom de les companyies

![](files_s1/S1N1E2.png)

Para obtener esta respuesta, debemos transformar la información de la tabla _**company**_, Para ello utilizo la función _**select**_ con los campos que solicitan y con _**order by**_ ordeno de manera alfabetica en funcion de los nombres de las compañias.

Para este ejercicio el output de la tabla es de 100 filas. 

## Exercici 3
Des de la secció de màrqueting et sol·liciten que els passis un llistat dels països que estan fent compres.

En este caso nos genera una tabla con 15 filas, que corresponden a los 15 paises. Este código creará una tabla con una columna llamada "Listado_paises" con los paises que tienes datos de compra en la tabla **transaction**: 

![](files_s1/S1N1E3.png)


## Exercici 4
Des de màrqueting també volen saber des de quants països es realitzen les compres.

En este caso, el resultado output muestra una tabla que entrega la suma de los paises que tienen datos en la tabla **transaction**

![](files_s1/S1N1E4.png)

    
## Exercici 5

El teu cap identifica un error amb la companyia que té aneu 'b-2354'. Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest aneu.

Para esto extraigo la informacion desde la tabla **company**, y a traves del comando _**WHERE**_ busco el id de la compañia. 

![](files_s1/S1N1E5.png)


## Exercici 6

A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana?

En este caso, considearamos que al solicitar la despesa mitjana se refiere a la despesa promedio. 

Por ello utilizo una funcion de promerido _**AVG**_. Como nos solicitan el la compañia con mayor despesa, puedo ordenarlos a traves de un _**order by**_ de mayor a menor (_**DESC**_) y obtener el _**LIMIT**_ 1.

![](files_s1/S1N1E6.png)

---

# Sprint 1 - Nivel 2

## Exercici 1

El teu cap està redactant un informe de tancament de l'any i et sol·licita que li enviïs informació rellevant per al document. 

Per a això et sol·licita verificar si en la base de dades existeixen companyies amb identificadors (aneu) duplicats.

En este caso, debo generar un consulta en la tabla _**company**_ buscando duplicados. 

![](files_s1/S1N2E1.png)


Utilizo el HAVING para identificar aquellos que tienen mas de 1 registro y con ello saber si hay duplicados.

Respuesta: No hay _**Id**_ s repetidos

## Exercici 2
En quin dia es van realitzar les cinc vendes més costoses? 

Mostra la data de la transacció i la sumatòria de la quantitat de diners.

![](files_s1/S1N2E2.png)


## Exercici 3
En quin dia es van realitzar les cinc vendes de menor valor? Mostra la data de la transacció i la sumatòria de la quantitat de diners.

Me baso en el ejercico anterior para obtener las 5 transacciones mas bajas esto se obtiene mediante:

![](files_s1/S1N2E3.png)

# Exercici 4
Quina és la mitjana de despesa per país?

Presenta els resultats ordenats de major a menor mitjà.

En este caso, mediante el comando _**ROUND**_ redondeo el numero a dos decimales para una mejor visualización. 

En el caso de _**order by**_ por defecto genera un orden de mayor a menor.

![](files_s1/S1N2E4.png)

# Sprint 1 - Nivel 3
## Exercici 1
Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada, 
d'aquelles que van realitzar transaccions amb una despesa compresa entre 100 i 200 euros. 

![](files_s1/S1N3E1.png)



## Exercici 2
Indica el nom de les companyies que van fer compres el 16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.

![](files_s1/S1N3E2.png)

- El comando _**DISTINCT**_ es necesario para asegurar que cada nombre de compañía se muestre solo una vez en los resultados.
- Para seleccionar las fechas especificadas lo primero es transformarlas a un formato **'%Y-%m-%d**. Para lo anterior:
	- Para el cambio de formato utilizo el comando _**DATE_FORMAT**_,
 	- Para seleccionar las fechas utilizo el comando _**WHERE**_ con el operado _**IN**_ ('2022-02-28', '2022-03-16', '2022-02-13').






