##BOOKMARK CHALLENGE##
**Instructions to set up Database:**
- Connect to psql
- Create the database using the psql command `CREATE DATABASE bookmark_manager;`
- Connect to the database using the pqsl command `\c bookmark_manager;`
- Run the query we have saved in the file 01_create_bookmarks_table.sql

**The website will have the following specification:**
- Show a list of bookmarks

| LIBRARY        |
| :------------- |
| -------------- |
| @saved_books   |
| -------------- |
| #list          |
```
I can see the list of bookmarks from the library.

get './'         -->  Button 'See List" calls #list from model and redirects to ./library
get './library'  -->  displays library.erb (list of bookmarks)
```

- Add new bookmarks
```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

| LIBRARY        | BOOKMARK         |
| :------------- |:-----------------|
| -------------- |------------------|
| @saved_books   |                  |
| -------------- |------------------|
| #list          | #add             |
| #add()         |                  |


<!-- - Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks -->
- 
