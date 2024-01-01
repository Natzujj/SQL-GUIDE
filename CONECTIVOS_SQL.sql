-- Alguns Conectivos -- 

-- Selecionando o banco de dados
USE BibliotecaDB

-- Selecionando TODOS os livros
SELECT * FROM Livros;

-- Selecionando livros que foram publicados após 1080
SELECT * FROM Livros l WHERE AnoPublicacao > 1980;

-- Selecionando livros que foram publicados após 1080 ou Do autor Gabriel Garcia
SELECT * FROM Livros l WHERE (AnoPublicacao > 1980) OR (AutorID = 1);

-- Contagem do numero de livros de cada genero. É criada uma tabela imaginária "NumeroLivros"
SELECT Genero, COUNT(*) AS NumeroLivros FROM Livros l GROUP BY Genero;

-- Contagem do número de livros de cada genero, visualizando apenas os que exitem 2 ou mais
SELECT Genero, COUNT(*) AS NumeroLivros FROM Livros l GROUP BY Genero HAVING COUNT(*) >= 2;

-- Listagem de nacionalidades distintas dos autores
SELECT DISTINCT Nacionalidade FROM Autores a;

-- Selecionando titulo e nome dos autores dos livros
SELECT Livros.Titulo , Autores.Nome 
FROM Livros  
INNER JOIN Autores ON Livros.AutorID = Autores.AutorID;