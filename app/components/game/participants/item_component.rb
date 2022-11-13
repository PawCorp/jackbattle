# frozen_string_literal: true

class Game::Participants::ItemComponent < ViewComponent::Base
  include Turbo::FramesHelper, Turbo::StreamsHelper
  include GamesHelper
  def initialize(participant:)
    raise "Participant is not a participant record, it's #{game.to_s}" unless participant.is_a?(Participant)

    @participant = participant
  end
end
