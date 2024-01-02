-- **Beginning a Transaction**
-- **Iniciando uma Transação**
BEGIN TRANSACTION;

-- **Perform some modification operations (INSERT, UPDATE, DELETE)**
-- **Realize algumas operações de modificação (INSERT, UPDATE, DELETE)**

-- **Committing the Transaction**
-- **Efetuando o Commit da Transação**
COMMIT;

--

-- **Beginning a Transaction**
-- **Iniciando uma Transação**
BEGIN TRANSACTION;

-- **Perform some modification operations (INSERT, UPDATE, DELETE)**
-- **Realize algumas operações de modificação (INSERT, UPDATE, DELETE)**

-- **Rolling Back the Transaction**
-- **Desfazendo a Transação**
ROLLBACK;

--

-- **Beginning a Transaction**
-- **Iniciando uma Transação**
BEGIN TRANSACTION;

-- **Perform some modification operations (INSERT, UPDATE, DELETE)**
-- **Realize algumas operações de modificação (INSERT, UPDATE, DELETE)**

-- **Rolling Back to a Savepoint**
-- **Desfazendo até um Ponto de Salvamento (Savepoint)**
SAVEPOINT SaveState;

-- **Perform more modification operations**
-- **Realize mais operações de modificação**

-- **Rolling Back to the Savepoint**
-- **Desfazendo até o Ponto de Salvamento**
ROLLBACK TO SAVEPOINT SaveState;

-- **Committing the Transaction**
-- **Efetuando o Commit da Transação**
COMMIT;
