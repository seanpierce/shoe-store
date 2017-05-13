# Shoe Retailer Databae

Shoe Retailer Database is a web app used to track brands of shoes and where they are sold. This project is an assignment focussing on developing applications using ActiveRecord and Sinatra, built with Ruby. The schema contains a _many to many_ relationship between **shoes table** and **stores table**.

<kbd><img src="public/img/screen-shot-shoe.png" alt=""></kbd>
<kbd><img src="public/img/screen-shot-store.png" alt=""></kbd>

### Prerequisites

Ruby  
Bundler  
Postgres

### Usage

* Clone, or download repo
* Run Postgres
  * if Postgres is not currently running, enter the command  `$ postgres` into your shell environment
  * if Postgres is not installed enter `$ gem install postgres` into your shell environment
* Once you've confirmed that Postgres is running, in your shell environment navigate to the folder containing the cloned repo and enter the following commands:
  * `$ bundle install`
  * `$ rake db:create`
  * `$ rake db:migrate`
  * `$ ruby app.rb` (you should see a message alerting you that the Sinatra server is now running!)
* In your bowser, navigate to **localhost:4567**

_Set up and installation resources and help:_  
[Running postgres](https://www.postgresql.org/docs/9.1/static/server-start.html)  
[Using rake](http://docs.seattlerb.org/rake/)  
[Using sinatra](http://www.sinatrarb.com/documentation.html)  
For issues specific to this project, please contact me directly.

### Built With

* Ruby
* ActiveRecord
* Sinatra
* HTML, CSS, Jquery

### Created by / contact info
Sean Pierce  
_sumler.sean@gmail.com_

_License MIT_  
Copyright &copy; Sean Pierce
