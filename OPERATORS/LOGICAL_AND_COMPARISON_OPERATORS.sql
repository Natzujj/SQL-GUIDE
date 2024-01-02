-- Selecionando o banco de dados
-- Selecting the database
USE BibliotecaDB;

-- Selecionando TODOS os livros
-- Selecting ALL books
SELECT * FROM Livros;

-- Selecionando livros que foram publicados após 1080
-- Selecting books published after 1080
SELECT * FROM Livros l WHERE AnoPublicacao > 1980;

-- Selecionando livros que foram publicados em um ano diferente de 1980
-- Selecting books published in a year different from 1980
SELECT * FROM Livros l WHERE AnoPublicacao <> 1980;

-- Listagem de nacionalidades distintas dos autores
-- Listing distinct nationalities of authors
SELECT DISTINCT Nacionalidade FROM Autores a;

-- Selecionando livros que foram publicados após 1980 ou Do autor Gabriel Garcia
-- Selecting books published after 1980 or by author Gabriel Garcia
SELECT * FROM Livros l WHERE (AnoPublicacao > 1980) OR (AutorID = 1);

-- Selecionando livros que foram publicados após 1980 E pertence ao autor Gabriel Garcia
-- Selecting books published after 1980 AND belonging to author Gabriel Garcia
SELECT * FROM Livros l WHERE (AnoPublicacao > 1980) AND (AutorID = 1);

-- Selecionando Autores cujo o ID seja MAIOR que TODOS os existentes nos autores ligados a tabela Livros
-- Selecting Authors whose ID is GREATER than ALL existing IDs in the authors linked to the Livros table
SELECT Nome FROM Autores WHERE AutorID > ALL (SELECT AutorID FROM Livros);

-- Selecionando Autores cujo o ID seja maior que pelo menos um AutorID dos Livros
-- Selecting Authors whose ID is greater than at least one AutorID from Livros
SELECT Nome FROM Autores WHERE AutorID > ANY (SELECT AutorID FROM Livros);

-- Selecionando registros dentro de um intervalo especificado
-- Selecting records within a specified range
SELECT Titulo, AnoPublicacao FROM Livros l WHERE AnoPublicacao BETWEEN 2000 AND 2020;

-- Selecionando registros que possuem pelo menos 1 livro associado a um autor
-- Selecting records that have at least 1 book associated with an author
SELECT Nome FROM Autores a WHERE EXISTS (SELECT 1 FROM Livros l WHERE AutorID = a.AutorID);

-- Selecionando registro que possuem termos especificados em qualquer posição
-- Selecting records that have specified terms in any position
SELECT Titulo FROM Livros l WHERE Titulo LIKE '%Potter%';

-- Selecionando registro que NÃO possuem termos especificados
-- Selecting records that do NOT have specified terms
SELECT Titulo, AnoPublicacao FROM Livros l WHERE NOT Genero = 'Mistério';

-- Selecionando registro que possuem alguma correspondencia com a sub-consulta (Semelhante ao ANY)
-- Selecting records that have some correspondence with the subquery (Similar to ANY)
SELECT Nome FROM Autores a WHERE AutorID = SOME (SELECT AutorID FROM LIVROS WHERE AnoPublicacao > 2000);
