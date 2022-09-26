# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_header_renders_site_title
    with_request_url_and_clearance "/" do
      sign_in
      render_inline(HeaderComponent.new)

      assert_selector('h1', text: 'Jackbattle')
    end
  end
end
