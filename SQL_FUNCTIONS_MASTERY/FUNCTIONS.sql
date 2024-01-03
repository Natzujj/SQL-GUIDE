-- **Using the BibliotecaDB Database**
-- **Usando o Banco de Dados BibliotecaDB**
USE BibliotecaDB;

-- **Total Count of Books in the Livros Table**
-- **Contagem total do número de livros na tabela Livros**
SELECT COUNT(*) as TotalLivros FROM Livros;

-- **Calculation of the Average Publication Year of Books**
-- **Cálculo da média do ano de publicação dos livros**
SELECT AVG(AnoPublicacao) AS MediaAnoPublicacao FROM Livros;

-- **Selection of Books Written by Colombian Authors**
-- **Seleção de livros escritos por autores colombianos**
SELECT Titulo FROM Livros WHERE AutorID IN (SELECT AutorID FROM Autores WHERE Nacionalidade = 'Colombiana');

-- **Count of the Number of Books for Each Genre. Creates an Imaginary Table "NumeroLivros"**
-- **Contagem do número de livros de cada gênero. É criada uma tabela imaginária "NumeroLivros"**
SELECT Genero, COUNT(*) AS NumeroLivros FROM Livros l GROUP BY Genero;

-- **Count of the Number of Books for Each Genre, Displaying Only Those with 2 or More**
-- **Contagem do número de livros de cada gênero, exibindo apenas os que existem 2 ou mais**
SELECT Genero, COUNT(*) AS NumeroLivros FROM Livros l GROUP BY Genero HAVING COUNT(*) >= 2;

-- **Count of the Number of Books with Different Nationalities**
-- **Contagem do número de livros com diferentes nacionalidades**
SELECT COUNT(DISTINCT Nacionalidade) AS NumNacionalidades FROM Autores;

-- **Selecting the Most Recent and Oldest Publication Years**
-- **Selecionando o ano de publicação mais recente e mais antigo**
SELECT MAX(AnoPublicacao) AS AnoMaisRecente, MIN(AnoPublicacao) AS AnoMaisAntigo FROM Livros;

-- **Selecting Author Names in Uppercase and Lowercase**
-- **Selecionando nomes dos autores em letras maiúsculas e minúsculas**
SELECT UPPER(Nome) AS NomeMaiusculo, LOWER(Nome) AS NomeMinusculo FROM Autores;

-- **Total Count of Books Grouped by Nationalities of Authors, Considering Books Published After 1980**
-- **Contagem total de livros agrupados por nacionalidades dos autores, considerando livros publicados depois de 1980**
SELECT Nacionalidade, SUM(CASE WHEN AnoPublicacao > 1980 THEN 1 ELSE 0 END) AS TotalLivros
FROM Autores
JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Nacionalidade;

-- **Selecting Title and Author Names of Books**
-- **Selecionando título e nome dos autores dos livros**
SELECT Livros.Titulo , Autores.Nome FROM Livros INNER JOIN Autores ON Livros.AutorID = Autores.AutorID;

-- **Count of the Total Number of Books by Authors of British Origin**
-- **Contagem do número total de livros de autores de origem Britânica**
SELECT Nacionalidade, COUNT(*) AS TotalLivros FROM Autores
JOIN Livros ON Autores.AutorID = Livros.AutorID
WHERE Nacionalidade = 'Britânica' GROUP BY Nacionalidade;

-- **Selecting the Top Author with the Most Published Books**
-- **Selecionando o autor com mais livros publicados**
SELECT TOP(1) Autores.Nome, COUNT(*) AS TotalLivrosPublicados
FROM Autores
JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Autores.Nome
ORDER BY TotalLivrosPublicados DESC;

-- **Selecting Author Names and Aggregating Book Titles**
-- **Selecionando nomes dos autores e agregando títulos dos livros**
SELECT Autores.Nome, STRING_AGG(Livros.Titulo, ', ') AS LivrosDoAutor
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Autores.Nome;
