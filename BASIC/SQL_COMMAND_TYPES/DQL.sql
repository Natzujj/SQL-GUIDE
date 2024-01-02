-- **Selecting All Columns from the Example Table**
-- **Selecionando Todas as Colunas da Tabela Example**
SELECT * FROM Example;

-- **Selecting Specific Columns (First_Name, Age) from Example where Age is Greater than 30**
-- **Selecionando Colunas Específicas (First_Name, Age) da Tabela Example onde Age é Maior que 30**
SELECT First_Name, Age FROM Example WHERE Age > 30;

-- **Selecting Specific Columns (First_Name, Age) from Example and Ordering by First_Name**
-- **Selecionando Colunas Específicas (First_Name, Age) da Tabela Example e Ordenando por First_Name**
SELECT First_Name, Age FROM Example ORDER BY First_Name;
