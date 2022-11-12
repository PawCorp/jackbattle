# frozen_string_literal: true

class GameThumbnailComponent < ViewComponent::Base
  include Turbo::FramesHelper, Turbo::StreamsHelper
  include GamesHelper

  def initialize(game:)
    raise "Game must be a game model" unless game.is_a? Game
    @game = game
  end
end
