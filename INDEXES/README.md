# INDEX

## What are Indexes?

In databases, an **index** is a structure that improves data retrieval speed in queries. In simpler terms, it's like an index in a book, helping to find specific information more quickly. Let's explore why and how we use indexes in our tables.

## Why Do We Use Indexes?

When we have a lot of data in a table, fetching information can become time-consuming. Indexes help speed up this process, acting as maps for the data. Here are some reasons to use indexes:

### 1. **Improved Query Performance:**
   - Imagine searching for a book without an index. You'd have to flip through all the pages until you find what you're looking for. Indexes are like a quick guide, helping the database locate specific data faster.

### 2. **Efficient Sorting and Filtering:**
   - If you need to sort or filter data frequently, indexes organize the data in a way that makes these operations more efficient.

### 3. **Enhancement in Join Operations (JOIN):**
   - When we need to combine data from different tables, indexes make this process easier, speeding up joins.

## How to Create Indexes?

Let's see some examples of creating indexes using fictional tables of authors and books.

### Simple Index:

```sql
CREATE INDEX idx_NomeAutores ON Autores(Nome);
```

### Unique Index::
```sql 
    CREATE UNIQUE INDEX idx_Titulo ON Livros(Titulo);
```

### Composite Index:
```sql
    CREATE INDEX idx_Autor ON Livros(AutorID, AnoPublicacao);
```
## Caution When Using Indexes:

### `Avoid Excessive Indexing`: 
Too many indexes can hinder performance in update operations (insert, update, delete). Use indexes wisely, considering the most frequent queries.

### `Monitor Performance:`
Evaluate the impact of indexes on the database's performance. What is efficient for one query may not be for another.