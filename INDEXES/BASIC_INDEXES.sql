-- ** COMMANDS WERE CREATED USING SQL SERVER! THERE MAY BE VARIATIONS USING OTHER DATABASES ** --

-- Creates an index on the 'Nome' column of the 'Autores' table.
CREATE INDEX idx_NomeAutores ON Autores(Nome);
SELECT * FROM Autores a WHERE Nome = 'Gabriel Garcia Marquez';
SELECT * FROM Autores a ORDER BY Nome;
SELECT * FROM Autores a WHERE Nome LIKE 'Gabriel%';
-- Drops the previously created index.
DROP INDEX idx_NomeAutores ON Autores;

CREATE INDEX idx_AutorAnoLivros ON Livros(AutorID, AnoPublicacao);
SELECT * FROM Livros WHERE AutorID = 2 AND AnoPublicacao > 2000;
SELECT * FROM Livros ORDER BY AutorID, AnoPublicacao DESC;
SELECT Autores.Nome, Livros.Titulo
FROM Autores
JOIN Livros ON Autores.AutorID = Livros.AutorID
WHERE Autores.AutorID = 3 AND Livros.AnoPublicacao > 2000;
DROP INDEX idx_AutorAnoLivros ON Livros;

-- EXAMPLE FULL TEXT INDEX: 

-- Verifica se o Fulltext Index está instalado
-- This query checks if the Fulltext Index is installed
SELECT SERVERPROPERTY('IsFullTextInstalled') AS is_fulltext_installed;

-- Verifica se o Fulltext Index está ativado
-- This query checks if the Fulltext Index is enabled
SELECT DATABASEPROPERTYEX('BibliotecaDB', 'IsFulltextEnabled');

-- Verifica se existe um catálogo
-- This query checks if there is a catalog
SELECT * FROM sys.fulltext_catalogs;

-- Cria um catálogo
-- This query creates a catalog
CREATE FULLTEXT CATALOG LivrosCatalog AS DEFAULT;

-- Verifica o status do catálogo
-- This query checks the status of the catalog
SELECT FULLTEXTCATALOGPROPERTY('LivrosCatalog', 'PopulateStatus') AS Status;

-- Cria um índice Fulltext
-- This query creates a Fulltext index
CREATE FULLTEXT INDEX ON BibliotecaDB.dbo.Livros (TITULO LANGUAGE 2070)
KEY INDEX Livros_PK ON LivrosCatalog;

-- Adiciona uma coluna ao índice Fulltext
-- This query adds a column to the Fulltext index
ALTER FULLTEXT INDEX ON BibliotecaDB.dbo.Livros ADD (TITULO LANGUAGE 2070);

-- Seleciona registros que contenham a palavra "Assassinato"
-- This query selects records that contain the word "Assassinato"
SELECT * FROM BibliotecaDB.dbo.Livros
WHERE CONTAINS(Titulo , 'Livro sobre Assassinato', LANGUAGE 'Portuguese');

-- Desativa o índice Fulltext
-- This query disables the Fulltext index
ALTER FULLTEXT INDEX ON BibliotecaDB.dbo.Livros DISABLE;

-- Remove a coluna do índice Fulltext
-- This query removes the column from the Fulltext index
ALTER FULLTEXT INDEX ON BibliotecaDB.dbo.Livros DROP (Titulo);

