USE BibliotecaDB;
-- Verificando se o ano de publicação é válido antes de inserir
-- Checking if the publication year is valid before insertion
CREATE TRIGGER valida_ano_publicacao
ON LIVROS
INSTEAD OF INSERT
AS
BEGIN
    -- Se o ano de publicação for válido, inserir os registros
    -- If the publication year is valid, insert the records
    IF (SELECT MIN(AnoPublicacao) FROM inserted) >= 1900
    BEGIN
        INSERT INTO LIVROS (LivroID, Titulo, AnoPublicacao, Genero, AutorID)
        SELECT LivroID, Titulo, AnoPublicacao, Genero, AutorID FROM inserted;
    END
    ELSE
    BEGIN
        -- Se o ano de publicação não for válido, gerar um erro
        -- If the publication year is not valid, raise an error
        RAISEERROR ('O ano de publicação deve ser maior ou igual a 1900!', 16, 1);
        ROLLBACK;
    END
END;

-- Inserindo um novo livro corretamente
-- Inserting a new book correctly
INSERT INTO LIVROS (Titulo, AnoPublicacao, Genero, AutorID)
VALUES ('A Metamorfose', 1915, 'Ficção', 3);

-- Inserindo um novo livro com erro, acionando a trigger
-- Inserting a new book with an error, triggering the validation trigger
INSERT INTO LIVROS (Titulo, AnoPublicacao, Genero, AutorID)
VALUES ('A Metamorfose', 1890, 'Ficção', 3);

-- Adicionando uma coluna para armazenar a última modificação
-- Adding a column to store the last modification
ALTER TABLE Autores ADD UltimaModificacao DATETIME;

-- Criando trigger para atualizar a data de modificação
-- Creating a trigger to update the modification date
CREATE TRIGGER atualiza_data_modificacao
ON AUTORES
AFTER UPDATE
AS
BEGIN
    UPDATE AUTORES
    SET UltimaModificacao = GETDATE()
    FROM AUTORES a
    INNER JOIN inserted i ON a.AutorID = i.AutorID;
END;

-- Atualizando informações de um autor com a trigger de modificação
-- Updating information of an author with the modification trigger
UPDATE AUTORES SET Nacionalidade = 'British' WHERE AutorID = 5;

-- Inserindo novos dados nas tabelas
-- Inserting new data into the tables
INSERT INTO Autores (AutorID, Nome, Nacionalidade, AnoNascimento) VALUES (6, 'Carlos Drummond de Andrade', 'Brasileira', 1902);
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, Genero, AutorID) VALUES (11, 'Sentimento do Mundo', 1940, 'Poesia', 6);
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, Genero, AutorID) VALUES (12, 'Sentimento do Mundo', 1940, 'Poesia', 6);
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, Genero, AutorID) VALUES (13, 'Sentimento do Mundo', 1940, 'Poesia', 6);

-- Criando trigger para remover livros associados ao autor ao deletar
-- Creating a trigger to remove books associated with the author upon deletion
CREATE TRIGGER remove_livros_autor
ON Autores 
INSTEAD OF DELETE 
AS
BEGIN
	DELETE FROM Livros WHERE AutorID IN (SELECT AutorID FROM deleted);
	DELETE FROM Autores WHERE AutorID IN (SELECT AutorID FROM deleted);
END;

-- Deletando um autor e seus livros associados
-- Deleting an author and their associated books
DELETE FROM Autores WHERE AutorID = 6;
