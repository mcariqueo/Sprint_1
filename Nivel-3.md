## Exercici 1
Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada, 
d'aquelles que van realitzar transaccions amb una despesa compresa entre 100 i 200 euros. 

    SELECT   		company.company_name,
			          company.phone,
			          company.country,
			          sum(transaction.amount)
    FROM     		transactions.company
    JOIN		    transactions.transaction
    ON			    company.id = transaction.company_id
    WHERE 		  transaction.amount BETWEEN 100 AND 200
    GROUP BY	  company.company_name, company.phone, company.country;
    ORDER BY	  sum(transaction.amount) DESC;



Ordena els resultats de major a menor quantitat gastada.


## Exercici 2
Indica el nom de les companyies que van fer compres el 16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.
