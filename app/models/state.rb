class State < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :truck
  belongs_to :driver
end
