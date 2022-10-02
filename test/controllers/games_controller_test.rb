require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = create(:game)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    user = create(:user)
    get new_game_url(as: user)
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_game_url(as: nil)
    assert_response :redirect
    assert_redirected_to sign_in_url
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { creator_id: @game.creator_id, name: @game.name } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    game = create(:game, name: 'something obscure')
    new_name = 'ailurus fulgens'

    patch game_url(game), params: { game: { name: new_name } }

    game.reload
    assert_redirected_to game_url(game)
    assert_equal(new_name, game.name, "Didn't update name")
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
