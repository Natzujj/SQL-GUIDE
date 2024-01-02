# Constraints in SQL

Constraints in SQL are rules applied to columns or sets of columns in a table to enforce data integrity. They define certain properties that data must adhere to, ensuring accuracy, consistency, and reliability in the database.

## `NOT NULL`

The `NOT NULL` constraint ensures that a column cannot have a NULL (missing or undefined) value. It enforces the presence of a value in the specified column.

## `UNIQUE`

The `UNIQUE` constraint ensures that all values in a column or a set of columns are distinct, prohibiting duplicate entries.

## `PRIMARY KEY`

The `PRIMARY KEY` constraint uniquely identifies each record in a table. It combines the `NOT NULL` and `UNIQUE` constraints, creating a primary key column or set of columns.

## `FOREIGN KEY`

The `FOREIGN KEY` constraint establishes a link between two tables by creating a relationship between a column in one table and the primary key in another table. It ensures referential integrity.

## `CHECK`

The `CHECK` constraint defines a condition that values in a column must satisfy. It allows the specification of conditions to validate the data.

## `DEFAULT`

The `DEFAULT` constraint provides a default value for a column when no explicit value is specified during an `INSERT` operation.

## `CREATE INDEX`

The `CREATE INDEX` statement creates an index on one or more columns of a table, enhancing the speed of data retrieval operations.

These constraints play a crucial role in maintaining data quality and consistency within a relational database.
