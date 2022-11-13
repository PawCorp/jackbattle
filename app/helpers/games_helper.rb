module GamesHelper
  def game_thumbnail_id (game)
    raise "Not a game record, was a #{game.to_s}" unless game.is_a? Game

    "game_#{game.id}_thumbnail"
  end

  def game_participants_id (game)
    raise "Not a game record, was a #{game.to_s}" unless game.is_a? Game

    "game_#{game.id}_participants"
  end
end
