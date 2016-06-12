class Driver < ActiveRecord::Base
  validates :name, :last_name, :phone, :identity_card_number, presence: true

  belongs_to :route

  has_many :states
  has_one :user
end
