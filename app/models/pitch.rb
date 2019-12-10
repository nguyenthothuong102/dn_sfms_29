class Pitch < ApplicationRecord
  belongs_to :user

  has_many :subpitches, dependent: :destroy

  scope :latest_pitches, ->{order created_at: :desc}

  scope :search_pitches, (lambda do |address|
    where "address LIKE ?", "%#{address}%"
  end)

  scope :search_city, (lambda do |city|
    where "city LIKE ?", "%#{city}%"
  end)

  scope :search_district, (lambda do |district|
    where "district LIKE ?", "%#{district}%"
  end)

  scope :search_time, (lambda do |start_time, end_time|
    where "(start_time >= ? and start_time <= ?)
            or (end_time >= ? and end_time <= ?)
            or (start_time <= ? and end_time >= ?)",
          start_time, end_time, start_time, end_time, start_time, end_time
  end)
end
