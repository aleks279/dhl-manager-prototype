class Driver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :last_name, :phone, :identity_card_number, presence: true

  belongs_to :route

  has_many :states
  has_one :user
end
