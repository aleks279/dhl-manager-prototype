class Warehouse < ActiveRecord::Base
  validates :name, presence: true

  has_many :products
  has_many :orders
  has_many :routes
end
