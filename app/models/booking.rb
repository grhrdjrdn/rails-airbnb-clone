class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :start_date, :end_date, presence: true
  enum :status, { pending: 0, booked: 1, denied: 2 }
end
