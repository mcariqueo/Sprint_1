# DataAnalytics_Sprint-1

# SPRINT 1 

## Objetivos: 
- Construir una base de dades relacional senzilla amb MySQL.
- Realitzar consultes senzilles.
- Realitzar operacions la base de dades MySQL.

## Origen de datos

La extraccion de datos se realiza a partir de la información entregada en la web. La base de datos tse llama "transactions" y esta compuesta de dos tablas (company y transaction)


## Exercici 1
Mostra les característiques principals de l'esquema creat i explica les diferents taules i variables que existeixen. Assegura't d'incloure un diagrama que il·lustri la relació entre les diferents taules i variables.

Esta base de datos consta de dos componentes principales:
  1. Tabla de hechos: transaction
      Contiene 9 campos con formatos que incluyen integer, float, fechas y caracteres. Esta tabla registra información detallada sobre las transacciones realizadas.
  2. Tabla de dimensiones: Company
	Contiene 6 campos, todos ellos de tipo string.
    	Funciona como una tabla de dimensiones, donde cada fila describe una compañía con información relacionada con contacto, teléfono, ubicación y sitio web.
En el contexto de esta base de datos, la tabla "transaction" representa los eventos o acciones específicas que ocurren, mientras que la tabla "company" proporciona información estática sobre las compañías involucradas en estas transacciones. Cada fila en la tabla "transaction" está asociada con un ID que corresponde a una transacción específica de una compañía específica, la cual está descrita en la tabla "company".
