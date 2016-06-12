class Product < ActiveRecord::Base
  validates :name, :weight, :price, presence: true

  belongs_to :order
  belongs_to :warehouse

  has_one :brand
  has_one :category
  has_one :presentation
  has_one :type
end
