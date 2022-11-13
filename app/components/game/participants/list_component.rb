# frozen_string_literal: true

class Game::Participants::ListComponent < ViewComponent::Base
  include Turbo::FramesHelper, Turbo::StreamsHelper
  include GamesHelper
  def initialize(game:)
    raise "Game is not a game record, it's #{game.to_s}" unless game.is_a?(Game)

    @game = game
  end
end
