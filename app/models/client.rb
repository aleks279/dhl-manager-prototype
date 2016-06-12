class Client < ActiveRecord::Base
  validates :name, :email, :phone, presence: true

  belongs_to :route

  has_one :location
  has_one :schedule
end
