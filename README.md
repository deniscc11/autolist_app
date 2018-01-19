# AUTOLIST TEST APP

## Versions
Ruby version: ruby 2.3.1p112  
Rails version: rails-5.0.6

List of gems used in this project:
* HTTParty: To create a connection with the API
* PG: postgresql gem to connect with the Database
* Bootstrap: For HTML and CSS styling

## Install the gems:
```
gem install bundler
bundle install
```

## Database creation
Create Database
```
rake db:create
```
Run migrations files
```
rake db:migrate
```

## Run rails server:
```
rails s
```

## API:
There is a service called "vehicles_api_service.rb" in charge of making the connection to the api, this service is initialized with the values of the search (page, price_max and price_min). Inside this file there is a search method that make an API call, using the HTTParty gem, to get the vehicles information  

The method called "set_pagination_info", it returns all the values needed to create the pagination such as: current_page, total_count, total_pages, pages.
Those values are used in a partial file (searches/_pagination.html.erb) to generate the pagination dinamically


## Caching Vehicules:
The results from the api response are cached and converted into object to be used in the vehicle details page, to cache this information I created the "cache_service.rb" that basically stores the vehicle data using a key generated with the "VIN" value, also there is another method called "get_data" to retrieve the desired vehicule
based on the vin code sent

## Vehicle Visit:
Each time a user visits the details page the application automatically creates a record using the VIN code and the current datetime, this information is stored using the VehicleVisit.rb model and helps us to obtain the information of the views made in the last hour  

###Remove old visits(views)
this task will eliminate all visits that are more than one hour old
```
rake vehicles:remove_old_visits
```


## Live Preview
[https://pure-eyrie-25388.herokuapp.com/]
