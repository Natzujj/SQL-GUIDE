# STORED PROCEDURES SQL

## Description
A stored procedure is a set of named SQL statements stored in a database. It can receive parameters, execute queries, and perform complex operations, providing an efficient way to encapsulate business logic in the database.

## Key Functions for Using a Stored Procedure

### `CREATE PROCEDURE`
To create a stored procedure, we use the `CREATE PROCEDURE` statement. 

### `EXECUTE`
After creation, we can execute the stored procedure using the `EXECUTE` or `EXEC` statement.

### Paramters with `@`
We can make our procedures more flexible by adding parameters. They are declared with the `@` symbol, like this:

```sql
CREATE PROCEDURE GetAutorPorNacionalidade
	@Nacionalidade VARCHAR(50)
AS
BEGIN
    -- Armazenamento com parâmetro
	SELECT Nome FROM Autores WHERE Nacionalidade = @Nacionalidade;
END;
```

### `OUTPUT`|`RETURN`
We can return results using OUTPUT or RETURN. See the example:

```sql 
CREATE PROCEDURE ContarAutores 
	@Contagem INT OUTPUT
AS
BEGIN
	SELECT @Contagem = COUNT(*) FROM Autores;
END;

DECLARE @Resultado INT;
EXECUTE ContarAutores @Contagem = @Resultado OUTPUT;
PRINT 'Número Total de Autores: ' + CAST(@Resultado AS VARCHAR(10));
```

--- 
### See more in [Microsoft](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-procedure-transact-sql?view=sql-server-ver16)