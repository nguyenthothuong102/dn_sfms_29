class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :subpitch

  has_one :rating
end
