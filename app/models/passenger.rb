class Passenger < ActiveRecord::Base

    include Statusable

    validates :name, presence: true

    has_many :routes

    def self.get_active
        where.not(status: Status[:deleted])
    end

    def self.get_active_for_select
        Passenger.get_active.order('name').map { |e| ["#{e.name} #{e.cellphone}",e.id] }
    end
end
