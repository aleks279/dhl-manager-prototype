class Order < ActiveRecord::Base
  validates :origin_country, :price, presence: true

  belongs_to :warehouse

  has_many :products
  has_one :payment_type
end
