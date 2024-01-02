-- Selecionando o banco de dados
USE BibliotecaDB

-- Selecionando TODOS os livros
SELECT * FROM Livros;

-- Selecionando livros que foram publicados após 1080
SELECT * FROM Livros l WHERE AnoPublicacao > 1980;

-- Selecionando livros que foram publicados em um ano diferente de 1980
SELECT * FROM Livros l WHERE AnoPublicacao <> 1980;

-- Listagem de nacionalidades distintas dos autores
SELECT DISTINCT Nacionalidade FROM Autores a;

-- Selecionando livros que foram publicados após 1980 ou Do autor Gabriel Garcia
SELECT * FROM Livros l WHERE (AnoPublicacao > 1980) OR (AutorID = 1);

-- Selecionando livros que foram publicados após 1980 E pertence ao autor Gabriel Garcia
SELECT * FROM Livros l WHERE (AnoPublicacao > 1980) AND (AutorID = 1);

-- Selecionando Autores cujo o ID seja MAIOR que TODOS os existentes nos autores ligados a tabela Livros
SELECT Nome FROM Autores WHERE AutorID > ALL (SELECT AutorID FROM Livros);

-- Selecionando Autores cujo o ID seja maior que pelo menos um AutorID dos Livros
SELECT Nome FROM Autores WHERE AutorID > ANY (SELECT AutorID FROM Livros);

-- Selecionando registros dentro de um intervalo especificado
SELECT Titulo, AnoPublicacao FROM Livros l WHERE AnoPublicacao BETWEEN 2000 AND 2020;

-- Selecionando registros que possuem pelo menos 1 livro associado a um autor 
SELECT Nome FROM Autores a WHERE EXISTS (SELECT 1 FROM Livros l WHERE AutorID = a.AutorID);

-- Selecionando registro que possuem termos especificados em qualquer posição
SELECT Titulo FROM Livros l WHERE Titulo LIKE '%Potter%';

-- Selecionando registro que NÃO possuem termos especificados
SELECT Titulo, AnoPublicacao FROM Livros l WHERE NOT Genero = 'Mistério';

-- Selecionando registro que possuem alguma correspondencia com a sub-consulta (Semelhante ao ANY)
SELECT Nome FROM Autores a WHERE AutorID = SOME (SELECT AutorID FROM LIVROS WHERE AnoPublicacao > 2000);
