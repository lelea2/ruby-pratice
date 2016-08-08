#### Module1

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

//Change db name
rails generate migration rename_cards_to_cars
//Generate db column name change
rails generate migration cars
//Then, go to db/migrate/*.rb file create
rename_column :table, :old_column_name, :new_column_name
```

##### Database

* Rails uses SQLite for database by default: self-contained, server-less, zero-configuration, transactional, relational SQL database engine ***(database.yml)***

```
rails db
sqlite> .tables
sqlite> .headers on
sqlite> .mode columns
```

##### DB Migration

* Ruby classes that extend ActiveRecord:Migration
* Migration code maintains a table called ***schema_miragtions*** table with one column called version
* Once the migration is applied, its version (timestamp) goes into the schema_migrations table

* def up ==> generate db schema changes
* def down ==> undo the chanegs introduced by the up method
* normally, "change" method is used

##### Type mapping
* :binary
* :boolean
* :date
* :datetime
* :decimal
* :float
* :integer
* :string
* :text
* :time

* null: true/false ==> false - a not null constraint is added
* limitL: size ==> sets a limit on the size of the field
