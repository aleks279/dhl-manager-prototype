class Schedule < ActiveRecord::Base
  validates :start_time, :end_time, :day, presence: true

  belongs_to :client
end
