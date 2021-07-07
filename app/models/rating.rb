class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :subpitch
  belongs_to :booking
  has_many :like_ratings, dependent: :destroy
end
