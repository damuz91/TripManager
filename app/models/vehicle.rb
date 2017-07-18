class Vehicle < ActiveRecord::Base

    include Statusable

    Categories = {one: 0, two: 1} # Could be bit type

    before_validation :upcase_plate, on: [:create, :update]
    before_validation :set_category, on: [:create, :update]    
    validates :plate, presence: true, uniqueness: true
    validates :color, presence: true
    validates :year, presence: true
    validate :company_plates

    has_many :routes

    def upcase_plate
        self.plate = self.plate.upcase
    end

    def set_category
        self.category = self.plate.start_with?('ABC') ? Categories[:one] : Categories[:two]
    end

    def company_plates
        errors.add(:plate, 'should start with ABC or DFG') unless self.plate.start_with?('ABC', 'DFG')
    end

    def category_name
        # TODO: I18n here:
        # TODO: The string version of the constant could be a different value, ask if the categories are numbers
        return "1" if self.category == Categories[:one]
        return "2" if self.category == Categories[:two]
    end

    def self.get_categories_for_select
        {
            "1"  => Categories[:one],
            "2" => Categories[:two]
        }
    end

    def self.get_years_for_select
        (1900..DateTime.now.year).map{|x| [x,x]}
    end

    def self.get_active
        where.not(status: Status[:deleted])
    end

    def self.get_active_for_select
        Vehicle.get_active.order('plate').map { |e| [e.plate,e.id] }
    end
end
