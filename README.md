# README

Just an example to show off basic Rails project.

Ruby: 2.3.0

Just: 

    $ bundle install
    $ rake db:create db:migrate db:seed
    $ rails server

API:

    GET /vehicles.json

    POST /vehicles.json
    ex:
    {
        "vehicle":{
            "plate": "ABC123",
            "color": "#FFF000",
            "year": "1950"
        }
    }

To test:

    $ bundle exec rspec spec/controllers/vehicles_controller.rb