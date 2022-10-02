class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :game, uniqueness: { scope: :user }

  after_create_commit do
    game.update_gameboard
  end

  after_destroy_commit do
    game.update_gameboard
  end
end
