-- Criando o banco de dados
CREATE DATABASE BibliotecaDB;

-- Selecionando o banco de dados
USE BibliotecaDB;

-- Tabela para armazenar informações sobre autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Nacionalidade VARCHAR(50),
    AnoNascimento INT
);

-- Tabela para armazenar informações sobre livros
CREATE TABLE Livros (
    LivroID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    AnoPublicacao INT,
    Genero VARCHAR(50),
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Inserindo dados na tabela Autores
INSERT INTO Autores (AutorID, Nome, Nacionalidade, AnoNascimento)
VALUES
    (1, 'Gabriel Garcia Marquez', 'Colombiana', 1927),
    (2, 'J.K. Rowling', 'Britânica', 1965),
    (3, 'Haruki Murakami', 'Japonesa', 1949),
    (4, 'Agatha Christie', 'Britânica', 1890),
    (5, 'George Orwell', 'Britânica', 1903);
    
-- Inserindo dados na tabela Livros
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, Genero, AutorID)
VALUES
    (1, 'Cem Anos de Solidão', 1967, 'Realismo Mágico', 1),
    (2, 'Harry Potter e a Pedra Filosofal', 1997, 'Fantasia', 2),
    (3, 'Norwegian Wood', 1987, 'Ficção', 3),
    (4, 'Assassinato no Expresso Oriente', 1934, 'Mistério', 4),
    (5, '1984', 1949, 'Distopia', 5),
    (6, 'O Amor nos Tempos do Cólera', 1985, 'Romance', 1),
    (7, 'Harry Potter e as Relíquias da Morte', 2007, 'Fantasia', 2),
    (8, 'Kafka à Beira-Mar', 2002, 'Ficção', 3),
    (9, 'O Caso dos Dez Negrinhos', 1939, 'Mistério', 4),
    (10, 'A Revolução dos Bichos', 1945, 'Sátira Política', 5);