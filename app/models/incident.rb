class Incident < ActiveRecord::Base
  validates :date, :description, presence: true

  belongs_to :route
end
