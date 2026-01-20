## SQL Commands

SQL commands are grouped into five main categories, each serving a distinct purpose in managing and interacting with relational databases. 

The five categories are:

1. **Data Definition Language (DDL)**: Used to define or modify the database structure (schema).
    - **CREATE**: Creates a new table, database, or other database objects.
    - **ALTER**: Modifies an existing database object, such as adding or dropping columns from a table.
    - **DROP**: Deletes a database object and all its data permanently.
    - **TRUNCATE**: Removes all data from a table, but keeps the table structure intact.
    - **RENAME**: Changes the name of a database object.

2. **Data Manipulation Language (DML)**: Used for managing the data within the database objects.
    - **INSERT**: Adds new records (rows) of data into a table.
    - **UPDATE**: Modifies existing data within a table.
    - **DELETE**: Removes specific records (rows) from a table.

3. **Data Query Language (DQL)**: Used for retrieving data from the database.
    - **SELECT**: Fetches data from one or more tables based on specified criteria.

4. **Data Control Language (DCL)**: Used to manage access and permissions within the database, ensuring security.
    - **GRANT**: Provides specific privileges or permissions to users or roles.
    - **REVOKE**: Removes previously granted privileges from users or roles.

5. **Transaction Control Language (TCL)**: Used to manage transactions and ensure data integrity and consistency, typically used with DML commands.
    - **COMMIT**: Permanently saves all changes made during the current transaction.
    - **ROLLBACK**: Undoes all changes in the current transaction and reverts the database to its state before the transaction started.
    - **SAVEPOINT**: Sets a point within a transaction to which you can later roll back, without rolling back the entire transaction. 

