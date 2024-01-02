-- **Inserting Data into the Example Table**
-- **Inserindo Dados na Tabela Example**
INSERT INTO Example (Id, Title) VALUES (1, 'Test');

-- **Updating Data in the Example Table**
-- **Atualizando Dados na Tabela Example**
UPDATE Example SET Title = 'Test2' WHERE Id = 1;

-- **Deleting Data from the Example Table**
-- **Removendo Dados da Tabela Example**
DELETE FROM Example WHERE Id = 1;

-- **Beginning a Transaction**
-- **Iniciando uma Transação**
BEGIN TRANSACTION;
    LOCK TABLE Example IN EXCLUSIVE MODE;
    -- OPERATIONS --
    -- OPERAÇÕES --
COMMIT;

-- **Merging Data into the Example Table**
-- **Mesclando Dados na Tabela Example**
MERGE INTO Example AS Target
USING (SELECT 1 AS Id, 'TEST' AS Title) AS Source
ON Target.Id = Source.Id
WHEN MATCHED THEN 
    UPDATE SET Target.Title = Source.Title
WHEN NOT MATCHED THEN 
    INSERT (Id, Title) VALUES (Source.Id, Source.Title);
