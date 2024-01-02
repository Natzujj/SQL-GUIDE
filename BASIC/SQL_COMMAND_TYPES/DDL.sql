-- **Creating a Database**
-- **Criando um Banco de Dados**
CREATE DATABASE DATABASE_EXAMPLE;

-- **Using the Database**
-- **Usando o Banco de Dados**
USE DATABASE_EXAMPLE;

-- **Creating a Table**
-- **Criando uma Tabela**
CREATE TABLE Example (
    Id INT PRIMARY KEY,
    Title VARCHAR(100),
);

-- **Altering the Table, Adding an "Email" Column**
-- **Alterando a Tabela, Adicionando uma Coluna "Email"**
ALTER TABLE Example ADD Email VARCHAR(100);

-- **Removing Data from the Table, Keeping the Structure**
-- **Removendo Dados da Tabela, Mantendo a Estrutura**
TRUNCATE TABLE Example;

-- **Adding a Comment to the "Title" Column of the Table**
-- **Adicionando um Comentário à Coluna "Title" da Tabela**
COMMENT ON COLUMN Example.Title IS 'Title here';

-- **Renaming the Table**
-- **Renomeando a Tabela**
RENAME TABLE Example TO New_Example;

-- **Dropping the Example Table from the Database**
-- **Removendo a Tabela Example do Banco de Dados**
DROP TABLE Example;
