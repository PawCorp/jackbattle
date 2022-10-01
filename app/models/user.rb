class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, length: { within: 6..126 }
  validates :password_confirmation, presence: true
end
