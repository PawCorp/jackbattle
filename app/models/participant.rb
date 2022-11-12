class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :game, uniqueness: { scope: :user }

  after_create_commit do
    game.after_update_participants
  end

  after_destroy_commit do
    game.after_update_participants
  end
end
