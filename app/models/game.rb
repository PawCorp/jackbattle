class Game < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :games
  has_many :participants, dependent: :destroy
  has_many :participating_users, class_name: 'Game', through: :participants, source: :user

  after_update_commit do
    update_gameboard
  end

  def update_gameboard
    broadcast_update
  end
end
