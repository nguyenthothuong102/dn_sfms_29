class Pitch < ApplicationRecord
  belongs_to :user
  scope :latest_pitches, ->{order(created_at: :desc)}
  scope(:search_pitches, lambda do |address|
    where("address LIKE ?", "%#{address}%")
  end)
  scope(:search_city, lambda do |city|
    where("city LIKE ?", "%#{city}%")
  end)
  scope(:search_district, lambda do |district|
    where("district LIKE ?","%#{district}%")
  end)

  scope(:search_time, lambda do |time|
    search = ""
    time.each do |column, value|
      if column && value
        (search += "AND") if search.present?
        search += "(#{column} = TIME('#{value}'))"
      end
    end
    where(search) if search
  end)
end
