##### SPRINT 1 #######
#####################################################################
############################# NIVEL 1 ###############################
#####################################################################
# Exercici 2
/* Realitza la següent consulta: Has d'obtenir el nom, email i país de cada companyia, 
   ordena les dades en funció del nom de les companyies */
	SELECT		company_name AS Nom, 
				email, 
				country AS Pais_companyia
	FROM 		transactions.company
	ORDER BY 	company_name ASC; # ordeno en funcion del nombre de la compañia en orden alfabetico.

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
	SELECT 
		SUM(contar_paises) AS Num_paises
	FROM
		(SELECT 
			COUNT(DISTINCT company.country) AS contar_paises
		FROM
			transactions.company
		JOIN transactions.transaction ON company.id = transaction.company_id
		GROUP BY company.country) AS count;
    
# Exercici 5
/* El teu cap identifica un error amb la companyia que té aneu 'b-2354'. 
Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest aneu.*/
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

#####################################################################
############################# NIVEL 2 ###############################
#####################################################################

#Exercici 1
/* El teu cap està redactant un informe de tancament de l'any i et sol·licita que li 
enviïs informació rellevant per al document. 
Per a això et sol·licita verificar si en la base de dades existeixen companyies 
amb identificadors (aneu) duplicats.*/

	SELECT DISTINCT * FROM transactions.company;
	SELECT DISTINCT id FROM transactions.company;
	SELECT DISTINCT company_name FROM transactions.company;
	SELECT DISTINCT phone FROM transactions.company;
	SELECT DISTINCT email FROM transactions.company;
	SELECT DISTINCT country FROM transactions.company;
	SELECT id, company_name, website FROM transactions.company;

## Exercici 2
/*En quin dia es van realitzar les cinc vendes més costoses? 
Mostra la data de la transacció i la sumatòria de la quantitat de diners.*/

/* Realizo un codigo para obtener la tabla*/
	SELECT 		DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
				amount As Monto,
				declined 
	FROM		transaction
	WHERE		declined !=1
	ORDER BY	amount DESC
	limit 		5;

/* Con este codigo obtengo la suma*/
	SELECT 			sum(monto) as total
	FROM 
		(SELECT 	DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
					amount As Monto,
					declined 
		FROM		transaction
		WHERE		declined !=1
		ORDER BY	amount DESC
		limit 5) 
		AS max_transaciones;

## Exercici 3
/*En quin dia es van realitzar les cinc vendes de menor valor? Mostra la data de la transacció i la sumatòria de la quantitat de diners.*/
	SELECT 			sum(monto) as total
	FROM 
		(SELECT 	DATE_FORMAT(timestamp, '%Y-%m-%d') AS fecha,
					amount As Monto,
					declined 
		FROM		transaction
		WHERE		declined !=1
		ORDER BY	amount ASC
		limit 5) 
		AS min_transaciones;

# Exercici 4
/*Quina és la mitjana de despesa per país? Presenta els resultats ordenats de major a menor mitjà.*/
	SELECT 		company.country 	AS Pais,
				round(avg(transaction.amount),2) AS Gasto_promedio
	FROM		transactions.company
	JOIN		transactions.transaction 
	ON company.id = transaction.company_id
	group by 	company.country
	order by	avg(transaction.amount) DESC;

#####################################################################
############################# NIVEL 3 ###############################
#####################################################################

## Exercici 1

/*Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada, d'aquelles que van realitzar transaccions amb una despesa compresa entre 100 i 200 euros.  Ordena els resultats de major a menor quantitat gastada. */

	SELECT 		company.company_name,
				company.phone,
				company.country,
				sum(transaction.amount) AS Quantitat_total
	FROM 		transactions.company
	JOIN		transactions.transaction
	ON			company.id = transaction.company_id
	WHERE 		transaction.amount BETWEEN 100 AND 200
	GROUP BY	company.company_name, company.phone, company.country
	ORDER BY	sum(transaction.amount) DESC;

## Exercici 2
/* Indica el nom de les companyies que van fer compres el 16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.*/

	SELECT DISTINCT	company.company_name
	FROM 			transactions.company
	JOIN			transactions.transaction
	ON				company.id = transaction.company_id
	WHERE			DATE_FORMAT(timestamp, '%Y-%m-%d') IN ('2022-02-28', '2022-03-16','2022-02-13');
