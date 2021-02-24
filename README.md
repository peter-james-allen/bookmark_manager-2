# bookmark manager

<img src= https://i.etsystatic.com/9663554/r/il/8900e7/2782369583/il_794xN.2782369583_ortp.jpg>

## How to set up

Connect to psql by entering the following into your terminal:
```
psql
```
Create the database you'll be using with the psql command:
```
CREATE DATABASE bookmark_manager;
```
Connect to the database using the following psql command:
```
\c bookmark_manager;
```
Run the query saved in the file:
```
01_create_bookmarks_table.sql
```
To run the RSpec/PG tests, you'll need to create a database solely for testing. Enter the following into your terminal (admin will be replaced by your computers username.)
```
$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

```
As a user,
so that I can revisit my favourite websites,
I would like to see a list of the bookmarks I've created.
```

<img width="629" alt="Screenshot 2021-02-22 at 15 00 30" src="https://user-images.githubusercontent.com/75075773/108837177-cb9ef280-75c9-11eb-8d43-8327bd95ecfa.png">

```
As a user,
so that I can revisit my favourite websites,
I would like to add to the list of bookmarks.
```

<img width="865" alt="Screenshot 2021-02-24 at 16 00 23" src="https://user-images.githubusercontent.com/75075773/109028256-86f28480-76b9-11eb-9eb4-f6c48b490864.png">
