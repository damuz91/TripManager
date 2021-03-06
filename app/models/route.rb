class Route < ActiveRecord::Base

    include Statusable

    validates :start_point, presence: true
    validates :end_point, presence: true
    validates :vehicle_id, presence: true
    validates :passenger_id, presence: true
    
    belongs_to :vehicle
    belongs_to :passenger

    def self.get_active
        # TODO: Do a custom join query in order to avoid n+1 quering
        where.not(status: Status[:deleted])
    end


end
