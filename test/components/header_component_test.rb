# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  test "renders site title" do
    render
    assert_selector('h1', text: 'Jackbattle')
  end

  test "signed out state" do
    render(as: nil)
    assert_selector('a', text: 'Sign in')
  end

  test "signed in state" do
    user = build(:user)
    render(as: user)
    assert_text(user.username)
    assert_selector('button', text: 'Sign out')
  end

  private

  def render(as: nil)
    with_user(as:) do
      render_component component: HeaderComponent
    end
  end
end
