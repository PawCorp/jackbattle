# frozen_string_literal: true

require "test_helper"

class GameThumbnailComponentTest < ViewComponent::TestCase
  test "renders a game's name" do
    game = create(:game)

    render_component(
      component: GameThumbnailComponent,
      props: { game: }
    )

    assert_text(game.name)
  end

  test "renders a game's total participants" do
    game = build(:game)
    create_list(:participant, 3, game:)

    render_component(
      component: GameThumbnailComponent,
      props: { game: }
    )

    assert_text(game.participants.count)
  end

  test "renders a link to game's show route" do
    game = create(:game)

    render_component(
      component: GameThumbnailComponent,
      props: { game: }
    )

    assert_selector("a[href='/games/#{game.id}']", text: game.name)
  end
end
