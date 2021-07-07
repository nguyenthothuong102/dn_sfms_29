class Subpitch < ApplicationRecord
  belongs_to :pitch
  belongs_to :subpitch_type

  has_many :bookings
  has_one_attached :picture
  scope :pitch, ->(pitch_id){where("pitch_id = \"?\"", pitch_id)}
  scope :join_subpitch, ->{joins(booking: :subpitch)
                     .where(bookings: {subpitch_id: @subpitch.id})}
end
