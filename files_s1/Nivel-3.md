## Exercici 1
Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada, 
d'aquelles que van realitzar transaccions amb una despesa compresa entre 100 i 200 euros. 

	SELECT		company.company_name,
			company.phone,
			company.country,
			sum(transaction.amount)
   	FROM		transactions.company
	JOIN		transactions.transaction
	ON		company.id = transaction.company_id
	WHERE		transaction.amount BETWEEN 100 AND 200
	GROUP BY	company.company_name, company.phone, company.country
	ORDER BY	sum(transaction.amount) DESC;

Este código produce 37 filas en el resultado y muestra la siguiente tabla ordenada de mayor a menor cantidad gastada.

<details>
	<summary>Tabla completa</summary>
	
|company_name | phone | country | Quantitat_total|
|-------------|--|--|--|
|'Enim Condimentum Ltd' | '09 55 51 66 25' | 'United Kingdom' | '2747.41'|
|'Nunc Interdum Incorporated' | '05 18 15 48 13' | 'Germany' | '2412.55'|
|'Ut Semper Foundation' | '01 60 36 33 06' | 'Sweden' | '2285.80'|
|'Arcu LLP' | '06 46 04 41 45' | 'Norway' | '1589.00'|
|'Lorem Eu Incorporated' | '01 83 66 62 07' | 'Canada' | '1544.61'|
|'Malesuada PC' | '01 74 85 68 70' | 'Ireland' | '1255.22'|
|'Non Institute' | '06 77 15 31 14' | 'United Kingdom' | '1078.31'|
|'At Associates' | '09 56 61 10 65' | 'New Zealand' | '368.81'|
|'Cras Vehicula Aliquet Industries' | '03 37 86 87 75' | 'Netherlands' | '339.92'|
|'Tristique Neque Venenatis Institute' | '04 34 85 12 85' | 'Sweden' | '296.30'|
|'Auctor Mauris Vel LLP' | '08 09 28 74 14' | 'United States' | '287.60'|
|'Nec Luctus LLC' | '02 14 71 75 73' | 'Norway' | '268.32'|
|'Amet Nulla Donec Corporation' | '07 15 25 14 74' | 'Italy' | '197.65'|
|'Ac Libero Inc.' | '04 36 20 64 29' | 'United Kingdom' | '186.34'|
|'Nunc In Foundation' | '03 79 81 18 92' | 'Italy' | '183.84'|
|'Ac Industries' | '09 34 65 40 60' | 'Germany' | '183.14'|
|'Tincidunt Associates' | '09 82 63 76 61' | 'Ireland' | '173.34'|
|'Dolor Vitae Limited' | '06 53 60 43 60' | 'France' | '164.88'|
|'Interdum Feugiat Sed Associates' | '04 88 40 32 52' | 'United Kingdom' | '164.86'|
|'Pede Cum Ltd' | '07 62 26 48 38' | 'Norway' | '160.78'|
|'Mauris Incorporated' | '06 84 33 15 97' | 'Norway' | '158.50'|
|'Mattis Foundation' | '06 74 03 95 74' | 'Australia' | '155.57'|
|'Quisque Libero LLC' | '01 45 48 71 11' | 'China' | '155.44'|
|'Dui Cras Associates' | '08 12 73 87 84' | 'Italy' | '153.89'|
|'Non Justo Corp.' | '09 30 54 14 44' | 'Sweden' | '151.32'|
|'Amet Faucibus Ut Foundation' | '03 21 62 47 12' | 'United Kingdom' | '144.33'|
|'Etiam Bibendum Fermentum Industries' | '07 46 69 45 02' | 'France' | '131.21'|
|'Fringilla LLC' | '08 29 15 93 57' | 'New Zealand' | '123.94'|
|'Donec Fringilla PC' | '01 51 58 14 44' | 'France' | '119.68'|
|'Ac Fermentum Incorporated' | '06 85 56 52 33' | 'Germany' | '119.36'|
|'Tortor Nunc Commodo Company' | '05 35 92 77 16' | 'United States' | '116.80'|
|'Pretium Neque Corp.' | '07 77 48 55 28' | 'Australia' | '116.74'|
|'Pede Ultrices Ltd' | '04 52 40 26 17' | 'Belgium' | '114.89'|
|'Orci Adipiscing Limited' | '03 18 00 77 81' | 'United Kingdom' | '111.64'|
|'Quam A Felis Industries' | '04 87 10 27 16' | 'Italy' | '109.49'|
|'A Institute' | '03 34 91 68 65' | 'Belgium' | '105.82'|
|'Nulla Integer Vulputate Corp.' | '04 57 50 84 48' | 'Sweden' | '105.42'|
</details>

## Exercici 2
Indica el nom de les companyies que van fer compres el 16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.


	SELECT DISTINCT		company.company_name
	FROM 			transactions.company
	JOIN			transactions.transaction
	ON			company.id = transaction.company_id
	WHERE			DATE_FORMAT(timestamp, '%Y-%m-%d') IN ('2022-02-28', '2022-03-16','2022-02-13');

Al ejecutar este codigo se entrega una lista con los nombres de las compañías que realizaron compras en las fechas indicadas.

- El comando _**DISTINCT**_ es necesario para asegurar que cada nombre de compañía se muestre solo una vez en los resultados.
- Para seleccionar las fechas especificadas lo primero es transformarlas a un formato **'%Y-%m-%d**. Para lo anterior:
	- Para el cambio de formato utilizo el comando _**DATE_FORMAT**_,
 	- Para seleccionar las fechas utilizo el comando _**WHERE**_ con el operado _**IN**_ ('2022-02-28', '2022-03-16', '2022-02-13').


El output en este caso es:

|     Company Name              |
|------------------------------|
| Sed LLC                      |
| Arcu LLP                     |
| Nunc Interdum Incorporated   |
| Ut Semper Foundation         |
| Lorem Eu Incorporated        |
| Malesuada PC                 |




