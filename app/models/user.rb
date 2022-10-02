class User < ApplicationRecord
  include Clearance::User
  has_many :games, foreign_key: :creator_id, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :participant_in_games, class_name: 'Game', through: :participants, source: :game
  validates :username, presence: true, uniqueness: true
end
