class User < ApplicationRecord
  include Clearance::User
  has_many :games, foreign_key: :creator_id, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :participant_in_games, class_name: 'Game', through: :participants, source: :game
  validates :username, presence: true, uniqueness: true

  def arrive_at_game(game)
    raise "game must be a Game model" unless game.is_a? Game

    game.participants.create(user: self)
  end

  def leave_game
    Participant.where(user: self).destroy_all
  end
end
