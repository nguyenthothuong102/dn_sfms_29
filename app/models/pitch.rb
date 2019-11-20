class Pitch < ApplicationRecord
  belongs_to :user
  scope :latest_pitches, ->{order(created_at: :desc)}
end
