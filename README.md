##BOOKMARK CHALLENGE##
**The website will have the following specification:**
- Show a list of bookmarks
```
| LIBRARY        |
| :------------- |
| -------------- |
| @saved_books   |
| -------------- |
| #list          |

I can see the list of bookmarks from the library.

get './'         -->  Button 'See List" calls #list from model and redirects to ./library
get './library'  -->  displays library.erb (list of bookmarks)
```

- Add new bookmarks
```
| LIBRARY        | BOOKMARK         |
| :------------- |:-----------------|
| -------------- |------------------|
| @saved_books   |                  |
| -------------- |------------------|
| #list          | #add             |
| #add()         |                  |

I can create a new bookmark
I can see the list of bookmarks from the library
```

- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks
