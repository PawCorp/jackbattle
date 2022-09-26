# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_header_renders_site_title
    render do
      assert_selector('h1', text: 'Jackbattle')
    end
  end

  def test_header_signed_out_state
    render(as: nil) do
      assert_selector('a', text: 'Sign in')
    end
  end

  def test_header_signed_in_state
    user = build(:user)
    render(as: user) do
      assert_text(user.email)
      assert_selector('button', text: 'Sign out')
    end
  end

  private

  def render(as: nil)
    with_user(as:) do
      render_inline(HeaderComponent.new)
      yield
    end
  end
end
