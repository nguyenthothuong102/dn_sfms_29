class User < ApplicationRecord
  before_save{email.downcase!}
  validates :full_name, presence: true, length: {maximum: Settings.size.s200}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
    length: {maximum: Settings.size.s200},
      format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false},
        on: :create
  has_secure_password
  validates :password, presence: true,
                  length: {minimum: Settings.size.s6}, allow_nil: true
end
