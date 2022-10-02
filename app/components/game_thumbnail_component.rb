# frozen_string_literal: true

class GameThumbnailComponent < ViewComponent::Base
  def initialize(game:)
    raise "Game must be a game model" unless game.is_a? Game
    @game = game
  end

end
