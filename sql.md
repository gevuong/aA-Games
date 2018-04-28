## Welcome to SQL Notes!

**A SQL query enters The Foo Bar, walks up to two tables, and asks, "Can I join you?"**

### What's the recommended way to write SQL in Ruby code?
- Use a **heredoc** (or here-document, here-text, here-string, here-script, hereis)
    - write multi-line strings for ease of readability.
    - produces a string like quotes, and returns said string in the place where it opening statement is.

    Example: 

        query = <<-SQL
            SELECT
                *
            FROM
                posts
            JOIN
                comments ON comments.post_id = posts.id
        SQL

        db.execute(query)

    - We could use any string for the start and end of a **heredoc**, (i.e. `<<-HTML, <<-JSON, <<-XML, <<-WHATEVER_YOU_WANT`). But if you're writing embedded SQL code, its just the convention to use `<<-SQL`. 

### That's cool. But can I pass variables to the query??
- Yes. You can pass variables using key-value pairs, or as a Ruby variable.

- For example: 
    - with Ruby variable and ? interpolation mark

        ```
        db.execute(<<-SQL, post_id)
        SELECT
            *
        FROM
            posts
        JOIN
            comments ON comments.post_id = posts.id
        WHERE
            posts.id = ?
        SQL
        ```

    - with key-value pairs

        ``` 
        db.execute(<<-SQL, post_id: post_id)
        SELECT
            *
        FROM
            posts
        JOIN
            comments ON comments.post_id = posts.id
        WHERE
            posts.id = :post_id
        SQL
        ```

### When would you use one over the other?

-  Values bound to the ? are done so positionally. This means that the first argument passed to a heredoc corresponds to the first ? in your SQL query code.

- In key-value pairs, the key acts as the placeholder for its corresponding value variable. This means that the order of key-value pair arguments doesn't matter.

- **Note: If you use a ? or key-value pair to pass in variables to a SQL query, SQLite3 will help protect against SQL injection attempts by escaping potentially malicious code for you.**

- For a little more info on [heredocs](https://makandracards.com/makandra/1675-using-heredoc-for-prettier-ruby-code)




- SQL
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

    - SQL JOINs
        - INNER JOIN (I think by default, a JOIN is INNER JOIN)
            - produces only a set of records that match in both Table A and B. Does not return any records with NULL
        - FULL OUTER JOIN 
            - produces the set of all records in Table A and Table B, with matching records from both sides where available. If there is no match, the missing side will contain NULL.
            - To produce the set of records unique to Table A and Table B, we perform the same full outer join, then **exclude the records we don't want from both sides via a where clause** (i.e. TableA.id IS NULL OR TableB.id IS NULL)
        - LEFT OUTER JOIN 
            - produces a complete set of records from Table A, with the matching records (where available) in Table B. If there is no match, the right side will contain NULL.
            - use WHERE clause to exclude records we don't want in Table B (i.e. TableB.id IS NOT NULL, TableB.id IS NULL)
        - RIGHT OUTER JOIN
            - produces a complete set of records from Table B, with the matching records (where available) in Table A. If there is no match, the right side will contain NULL.
            - use WHERE clause to exclude records we don't want in Table B (i.e. TableA.id IS NOT NULL, TableA.id IS NULL)
        - This excellent [article](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/) explains JOINS very well.


- ActiveRecord
    - All models in Rails inherit from ActiveRecord
    - an ORM (object relational mapping), allows us to represent data from a DB as Ruby objects
    - contains a number of methods to implement basic CRUD functionalities and SQL queries.
    - Has built in caching

    - Lazy-loading
        - Querying methods like group, having, includes, joins, select and where return an object of type ActiveRecord::Relation. The `Relation` object is array-like, and can be iterated through or indexed into.
        - HOWEVER, the `Relation` is not fetched until we actually need the results and the query is fired. This is why ActiveRecord queries are lazy.

        ```
        users = User.where('likes_dogs = ?', true) # no fetch yet!

        # performs fetch here
        users.each { |user| puts "Hello #{user.name}" }
        # does not perform fetch; result is "cached"
        users.each { |user| puts "Hello #{user.name}" }
        ```

        - After the queries are run, the results are cached, and stored for later re-use. The problem with caching is if the cached result is out-of-date if a new record is added and not yet cached. Simple solution to that would be to force association to be reloaded using `user.posts(true)`, or to toss all cached Relations using `user.reload`.
        - Benefits of laziness is that you can build complex queries by chaining query methods, which are not executed until it is finished being built and evaluated.
        - However, you can force querying a Relation by using load() or count().

- N+1 queries
    - Lets say you want the **number** of comments per post by a User. You make 1 query to find the users post, and N queries by iterating through posts to find all of its comments.
    - This is very inefficient if you consider a User having 10,000 posts. You'd be making 10,000 queries!
    - Each DB query has a fixed overhead, so it's good to batch up work into one query if possible.

    - Option 1: Eager loading
        - prefetching data using associations and .includes(). For example: `posts = user.posts.includes(:comments)`. This allows you to fetch all comments of all posts in one go, rather than query one-by-one per post.
        - Best to use eager loading an association if you plan to use those associated records, and not "aggregate" them.
    - Option 2: Joining Tables
        - eager loading returns lots of data, which is unnecessary if all you want is the number of comments.
        - When we want to use aggregate functions (i.e. MIN(), MAX(), COUNT(), AVG(), SUM()) with the associated records, like getting the sum of comments (and don't care about the comments themselves), use .joins().


### Additional Notes: psql commands
- Steps to create a DB and Table using CLI
    - login user in psql: `psql postgres` or `psql GeorgeV.` Once logged in CLI should be `#postgres` or `#GeorgeV.`
    - to create database: CREATE DATABASE <insert_db_name>
    - to list databases: \l
    - to access database: psql <insert_db_name>
    - to create table: CREATE TABLE <insert_table_name> 

        ```
                    CREATE TABLE COMPANY(
            ID INT PRIMARY KEY     NOT NULL,
            NAME           TEXT    NOT NULL,
            AGE            INT     NOT NULL,
            ADDRESS        CHAR(50),
            SALARY         REAL
            );
        ```

        For more info: https://www.tutorialspoint.com/postgresql/postgresql_create_table.htm

    - to list all tables: \d
    - to exit psql CLI: \q
