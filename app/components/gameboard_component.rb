# frozen_string_literal: true

class GameboardComponent < ViewComponent::Base
  def initialize(game:)
    raise "Game is not a game record, it's #{game.to_s}" unless game.is_a?(Game)

    @game = game
  end
end
