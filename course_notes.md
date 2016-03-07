* All the course lectures are from https://github.com/jhu-ep-coursera
* The following is my own notes

#### Lecture 3

* Rails ==> COC (Conventions over configurations)
* Rails ==> Abstract DB, ORM (Map your DB to Ruby classes)
* Rails uses SQLite for DB by default
* Support MVC
  a. Model: represent data the application is working with (business logic)
  b. View: visual representation of data
  c. Controlle: orchestrates interaction between model and view

##### How to create and run Rails App

* Create rails app by the command below
```
rails new my_first_app
### Give you more option
### rails new -h
### Rails with automatically generate .gitignore
```
* Run "bundle install"
* Run your app
```
rails server
###OR
### rails s
```
Note: Static pages live inside public directory

##### Generate dynamic content in Rails (Controller & Route)

1. Request sent
2. Router routes request to controller
3. Controller <--> Model
4. Controller invokes Views
5. Views render data

* Generate controller
```
rails g controller greeter hello
==> app/controllers/greeter_controller.rb
==> app/views/greeter/hello.html.erb

```
* Generate .erb (embedded view) ==> allow evaluate or output an expression

```ruby
<% random_name = ["Alex", "Joe", "Michael"] %>
<h1>Greetings <%= random_names.sample %></h1>
<p>The time now is <%= Time.now %></p>
```

```ruby
class GreeterController < ApplicationController
  def hello
  end

  def goobye
  end
```

* Generate routes (config/routes.rb)
```ruby
### Route corresponding with controller above
Rails.application.routes.draw do

get 'greeter/hello' => "greeter#hello"
get 'gretter/goodbye'
```

* rake (ruby's make)
```
rake --tasks
rake --describe task_name

##### Moving business logic out of view
* If action(method) is not really do anything => can remove it (as long as there is corresponding route, your view will work)
* Every new request create new instance variable in rails

```ruby
random_names = ["Alex", "Joe", "Michael"]
@name = random_names.sample
@time = Time.now

```

* Rails helper
Helpers are "macros"/"formatters" to your view. when using link_to, there is no need to change things if path change. (Also image_tag that generate ```<image>```)
```
#link_to name path
<% link_to "Google", "https://www.google.com" %>
```

##### Ruby gem
* Package manager in ruby

###### HTTParty
```
gem list httparty -d
```
* Restful webservice client
* Automatically parsing JSON and XML into Ruby hashes
* http authencation and http request parameter.

```ruby
require 'httparty'
require 'pp'

class Coursera
  include HTTParty

  base_uri = 'https//api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json

  def self.for term
    get("", query: { query: term })["elements"] #ruby ways to get hashed value of parameter
  end
end

pp Coursera.for "python"
```

```ruby
class CoursesController < ApplicationController
  def index
    @search_term = params[:looking_for] || 'jhu' #making your search term dynamic
    @courses = Coursera.for(@search_term) || []
  end
end
```

* Generate HTML markup

```
### do loop of courses
<% if @courses?nil %>
  <p>No info found for following information</p>
<% else %>
  <% courses.each do |course| %>
  <tr>
    <td><%= image_tag(course["smallIcon"]) %></td>
    <td><%= course["name"] %></td>
    <td><%= course["shortDescription"] %></td>
  </tr>
  <% end %>
<% end %>
```

##### Deployment
* Gem per env patterns as below

```
gem 'sqlite3', group:development

group:development do
  gem ''
end

group:production do
  gem ''
end
```

##### Ruby black box testing
* Selenium testing


