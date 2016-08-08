##### Scaffolding

* Code generator for entities
* simple prototypes to work with
* Let you get up and run quickly

```
//Create fancy_cars application
rails new fancy_cars
cd fancy_cars
rails g scaffold cars make color year:integer
rake db:migrate
//Run server
rails s
//http://localhost:3000/cars
//http://localhost:3000/cars/new
//http://localhost:3000/cars.json
```

* Rails uses SQLite for database by default: self-contained, server-less, zero-configuration, transactional, relational SQL database engine ***(database.yml)***

```
rails db
sqlite> .tables
sqlite> .headers on
sqlite> .mode columns
```
