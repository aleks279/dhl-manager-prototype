class Brand < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :product
end
