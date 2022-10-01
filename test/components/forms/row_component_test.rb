# frozen_string_literal: true

require "test_helper"

class Forms::RowComponentTest < ViewComponent::TestCase
  test "renders content" do
    title = "ailurus"

    render_component(
      component: Forms::RowComponent,
      props: { errors: [] }
    ) do
      title
    end

    assert_text(title)
  end
end
