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

### Descripcion de la base de datos
   El comando DESCRIBE se usa para obtener información sobre la estructura de una tabla específica
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
### Interpretación de la tabla
   En el contexto de esta base de datos, la tabla "transaction" representa los eventos o acciones específicas que ocurren, mientras que la tabla "company" proporciona información estática        sobre las compañías involucradas en estas transacciones. 
   Cada fila en la tabla "transaction" está asociada con un ID que corresponde a una transacción específica de una compañía específica, la cual está descrita en la tabla "company".




