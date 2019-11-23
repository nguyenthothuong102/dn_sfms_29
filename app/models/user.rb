class User < ApplicationRecord
  has_many :ratings
  PARAMS = %i(full_name email phone password password_confirmation).freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :full_name, presence: true, length: {maximum: Settings.size.s200}
  validates :email, presence: true,
    length: {maximum: Settings.size.s200},
      format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false},
        on: :create
  validates :password, presence: true,
                  length: {minimum: Settings.size.s6}, allow_nil: true

  before_save{email.downcase!}

  has_secure_password
end
