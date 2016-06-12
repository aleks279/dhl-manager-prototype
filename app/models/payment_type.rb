class PaymentType < ActiveRecord::Base
  validates :name, :payment_deadline, presence: true

  belongs_to :order
end
