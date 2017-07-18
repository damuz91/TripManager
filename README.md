# README

Just an example to show off basic Rails project.

Just: 

    $ bundle install & rake db:create db:migrate db:seed & rails server

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