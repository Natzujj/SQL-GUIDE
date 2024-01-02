-- **NOT NULL Constraint**
-- **Restrição NOT NULL**
CREATE TABLE Exemplo (
    ID INT NOT NULL,
    Nome VARCHAR(50) NOT NULL
);

-- **UNIQUE Constraint**
-- **Restrição UNIQUE**
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(50) UNIQUE
);

-- **PRIMARY KEY Constraint**
-- **Restrição PRIMARY KEY**
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NomeCliente VARCHAR(50)
);

-- **FOREIGN KEY Constraint**
-- **Restrição FOREIGN KEY**
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- **CHECK Constraint**
-- **Restrição CHECK**
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY,
    Salario DECIMAL(10, 2) CHECK (Salario > 0)
);

-- **DEFAULT Constraint**
-- **Restrição DEFAULT**
CREATE TABLE Configuracoes (
    ConfigID INT PRIMARY KEY,
    LimiteNotificacoes INT DEFAULT 10
);

-- **CREATE INDEX Statement**
-- **Declaração CREATE INDEX**
CREATE INDEX idx_NomeProduto ON Produtos(NomeProduto);
