### Hey, Welcome to SQL Notes!

**A SQL query enters The Foo Bar, walks up to two tables, and asks, "Can I join you?"**


- SQL vs NoSQL


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

    - Understanding SQL JOINs
        - This [article](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/) explains it very well.


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


### psql commands
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
