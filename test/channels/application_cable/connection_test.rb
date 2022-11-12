require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  def test_connection_success_when_cookie_is_set_correctly
    user = create(:user)
    cookies[Clearance.configuration.cookie_name] = user.remember_token
    connect

    assert_equal connection.current_user.id, user.id
    assert_equal connection.active_game, nil
  end

  def test_connection_removes_participant_when_disconnecting
    user = create(:user)
    cookies[Clearance.configuration.cookie_name] = user.remember_token
    connect
    connection.active_game = create(:game)
    participant = create(:participant, {game: connection.active_game, user:})

    disconnect

    assert_not Participant.exists? participant.id
  end
end
