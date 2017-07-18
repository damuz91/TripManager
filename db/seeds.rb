100.times {
    Vehicle.create(plate: "#{['abc','dfg'].sample}#{rand(0..999)}", color: Faker::Color.hex_color, year: rand(1900..DateTime.now.year))
}

300.times {
    Passenger.create(name: Faker::Name.name, cellphone: Faker::PhoneNumber.cell_phone)
}

50.times {
    Route.create(start_point: Faker::Address.street_address, end_point: Faker::Address.street_address, vehicle_id: Vehicle.get_active.sample.id, passenger_id: Passenger.get_active.sample.id)
}