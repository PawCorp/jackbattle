require "test_helper"

class ParticipantPresenceChannelTest < ActionCable::Channel::TestCase
  def test_arrive_at_game_adds_participant
    user = create(:user)
    game = create(:game)

    stub_connection({
                      current_user: user,
                      active_game: nil
                    })

    subscribe

    assert game.participants.where(user:).empty?

    perform 'arrive_at_game', { 'game_id': game.id }

    assert_not game.participants.where(user:).empty?
    assert_equal game.participants.where(user:).first.user, user
  end

  def test_leave_game_removes_participant
    user = create(:user)
    game = create(:game)
    create(:participant, {game:, user:})

    stub_connection({
                      current_user: user,
                      active_game: game
                    })

    subscribe

    assert_not game.participants.where(user:).empty?

    perform 'leave_game'

    assert game.participants.where(user:).empty?
  end

  def test_calls_leave_game_when_disconnecting
    user = create(:user)
    game = create(:game)
    create(:participant, {game:, user:})

    stub_connection({
                      current_user: user,
                      active_game: game
                    })

    subscribe

    assert_not game.participants.where(user:).empty?

    unsubscribe

    assert game.participants.where(user:).empty?
  end
end
