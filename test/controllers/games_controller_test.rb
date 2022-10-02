require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = create(:game)
  end

  # Index

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should show all games with participants" do
    games_with_participants = create_list(:game, 3)
    games_with_participants.each do |game|
      create(:participant, game:, present: true)
    end

    games_with_offline_participants = create_list(:game, 3)
    games_with_offline_participants.each do |game|
      create(:participant, game:, present: false)
    end

    games_without_participants = create_list(:game, 3)

    get games_url

    games_with_participants.each { |game| assert_select "##{dom_id game}" }
    games_without_participants.each { |game| assert_select "##{dom_id game}", count: 0 }
    games_with_offline_participants.each { |game| assert_select "##{dom_id game}", count: 0 }
  end

  # Mine

  test "should get my games" do
    get games_url :mine
    assert_response :success
  end

  test "should only show list of my games" do
    someone_elses_game = create(:game, creator: create(:user))
    create(:participant, game: someone_elses_game, present: true)

    assert_not_equal(someone_elses_game.creator.id, @game.creator.id)

    get my_games_url(as: @game.creator)

    assert_select "##{dom_id @game}", { count: 1 }, "Missing my game from the list"
    assert_select "##{dom_id someone_elses_game}", { count: 0 }, "Included someone else's game in my list"
  end

  # New

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

  # Create

  test "should create game" do
    assert_difference("Game.count") do
      post games_url(as: create(:user)), params: { game: { creator_id: @game.creator_id, name: @game.name } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should not create game if not logged in" do
    assert_no_difference("Game.count") do
      post games_url, params: { game: { creator_id: @game.creator_id, name: @game.name } }
    end
    assert_response :redirect
    assert_redirected_to sign_in_url
  end

  # Show

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  # Edit

  test "should get edit" do
    get edit_game_url(@game, as: @game.creator)
    assert_response :success
  end

  test "should not get edit if logged in as someone other than the creator" do
    get edit_game_url(@game, as: create(:user))
    assert_response :redirect
    assert_redirected_to sign_in_url
  end

  test "should not get edit if not logged in" do
    get edit_game_url(@game)
    assert_response :redirect
    assert_redirected_to sign_in_url
  end

  # Update

  test "should update game" do
    game = create(:game, name: 'something obscure')
    new_name = 'ailurus fulgens'

    patch game_url(game, as: game.creator), params: { game: { name: new_name } }

    game.reload
    assert_redirected_to game_url(game)
    assert_equal(new_name, game.name, "Didn't update name")
  end

  test "should not update game if logged in as someone other than the creator" do
    game = create(:game, name: 'something obscure')
    new_name = 'ailurus fulgens'

    patch game_url(game, as: create(:user)), params: { game: { name: new_name } }

    game.reload
    assert_response :redirect
    assert_redirected_to sign_in_url
    assert_not_equal(new_name, game.name, "Updated name when it shouldn't")
  end

  test "should not update game if not logged in" do
    game = create(:game, name: 'something obscure')
    new_name = 'ailurus fulgens'

    patch game_url(game), params: { game: { name: new_name } }

    game.reload
    assert_response :redirect
    assert_redirected_to sign_in_url
    assert_not_equal(new_name, game.name, "Updated name when it shouldn't")
  end

  # Destroy

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game, as: @game.creator)
    end

    assert_redirected_to games_url
  end

  test "should not destroy game if not logged in" do
    assert_no_difference("Game.count") do
      delete game_url(@game)
    end

    assert_response :redirect
    assert_redirected_to sign_in_url
  end

  test "should not destroy game if logged in as someone other than the creator" do
    assert_no_difference("Game.count") do
      delete game_url(@game, as: create(:user))
    end

    assert_response :redirect
    assert_redirected_to sign_in_url
  end
end
