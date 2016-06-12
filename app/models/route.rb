class Route < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :warehouse

  has_many :trucks
  has_many :drivers
  has_many :clients
  has_many :incidents
end
