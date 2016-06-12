class Location < ActiveRecord::Base
  validates :longitude, :latitude, presence: true

  belongs_to :truck
  belongs_to :client
end
