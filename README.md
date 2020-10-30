# Team MAKE: Makers BnB 


## How to use

1. Clone this repository:
```
git clone <repo_name>
```
2. Run bundle install:
```
bundle install
```
3. Run configuration file:
```
rackup config.ru
```
4. Visit localhost in browser:
```
http://localhost:9292/
```

## Database Set Up

1. Connect to psql:
```
psql
```
2. Create a database:
```
CREATE DATABASE makers_bnb_manager;
```
3. Create a spaces table using query from db/migrations/file 01_create_spaces_table.sql:
```
CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60));
```
4. Create a users table using query from file db/migrations02_create_users_table.sql:
```
CREATE TABLE users( id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60), display_name VARCHAR(60));
```
5. Add a description column to the spaces table using query from file db/migrations/03_add_desc_to_spaces.sql:
```
ALTER TABLE spaces ADD COLUMN description VARCHAR(200);
```
6. Add a user_id column to spaces table referencing id in users table using query from file db/migrations/04_add_user_id_as_foreign_key.sql:
```
ALTER TABLE spaces ADD COLUMN user_id INTEGER REFERENCES users(id);
```
7. Add a price column to the spaces table using query from file db/migrations/05_add_price_to_spaces_table.sql:
```
ALTER TABLE spaces ADD COLUMN price VARCHAR(10);
```
8. Repeat above steps for test database, makers_bnb_manager_tests, in order to run rspec.


## Planning

### Specifications:
1. Any signed-up user can list a new space.
2. Users can list multiple spaces.
3. Users should be able to name their space, provide a short description of the space, and a price per night.
4. Users should be able to offer a range of dates where their space is available.
5. Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
6. Nights for which a space has already been booked should not be available for users to book that space.
7. Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories

1. Any signed-up user can list a new space:

```
As a user
so I can create an account
I'd like to sign up
```

```
As a user
So that i can list a property,
I'd like to list a space.
```

```
As a user
So that only I can post my properties
I'd like to be able to log in and log out.
```

2. Users can list multiple spaces.

```
As a user
So that I can list all my properties
I would like to be able to list multiple properties.
```

3. Users should be able to name their space, provide a short description of the space, and a price per night.

```
As a user
So that I can properly advertise a space,
I'd like to be able to add a name, description and price.
```

```
As a user
So that I can see the details of the properties
I would like to be able to click on a name and see a description.
```

## Diagramming

![Diagram](https://i.imgur.com/0n0V5WK.png)

#### Class: User
|Responsibilities|Collaborators|
|----------|-----------|
|Knows email||
|Knows password||
|Knows display name||
|Can create a new user (.create)||
|Can list a space|Space|

#### Class: Space
|Responsibilities|Collaborators|
|----------|-----------|
|Knows name||
|Knows description||
|Knows price per night||
|Knows which user it belongs to|User|
|Can return all spaces (.all)||
|Can create a new space (.create)||
		


