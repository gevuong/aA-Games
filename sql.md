- Example of the order of execution of a Query

```
Complete SELECT query
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;
```

- Understanding SQL JOINs
    - This [article](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/) explains it very well.
