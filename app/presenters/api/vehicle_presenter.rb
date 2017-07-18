class Api::VehiclePresenter

    attr_accessor :plate, :color, :year, :category

    def initialize(vehicle)
        @plate = vehicle.plate
        @color = vehicle.color
        @year = vehicle.year
        @category = vehicle.category_name
    end

end
