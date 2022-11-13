class Participant < ApplicationRecord
  include GamesHelper

  belongs_to :user
  belongs_to :game
  validates :game, uniqueness: { scope: :user }

  after_create_commit do
    game.after_update_participants

    broadcast_append_later_to game, target: (game_participants_id self.game), html: ApplicationController.render_component(Game::Participants::ItemComponent.new(participant: self))
  end

  after_destroy_commit do
    game.after_update_participants

    broadcast_remove_later_to game, target: (dom_id self)
  end
end
