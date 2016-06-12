class Truck < ActiveRecord::Base
  validates :plate_number, :year, :model, :weight_capacity, presence: true

  belongs_to :route
  has_one :fuel_type
  has_one :location
  has_many :states
end
