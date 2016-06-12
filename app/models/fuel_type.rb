class FuelType < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :truck
end
