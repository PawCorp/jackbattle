class ParticipantPresenceChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
    leave_game
  end

  def arrive_at_game(data)
    if data['game_id']
      game = Game.find(data['game_id'])
      if game && connection.current_user
        connection.current_user.arrive_at_game(game)
      end
    end
  end

  def leave_game
    if connection.current_user
      connection.current_user.leave_game
    end
  end
end
