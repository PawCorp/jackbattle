# frozen_string_literal: true

require "test_helper"

class Forms::RowComponentTest < ViewComponent::TestCase
  mock_form = { }
  def mock_form.label(name)
    "label for #{name}"
  end

  test "renders content in .form-row__controls" do
    content = "ailurus"
    mock_user = build(:user)

    render_component(
      component: Forms::RowComponent,
      props: { name: :username, record: mock_user, form: mock_form }
    ) do
      content
    end

    assert_selector('.form-row__controls', text: content)
  end

  test "renders a label" do
    targeting = :username
    mock_user = build(:user)

    render_component(
      component: Forms::RowComponent,
      props: { name: :username, record: mock_user, form: mock_form }
    )

    assert_text(mock_form.label(targeting))
  end

  test "does not renders a label if no name provided" do
    mock_user = build(:user)

    render_component(
      component: Forms::RowComponent,
      props: { record: mock_user, form: mock_form }
    )

    assert_no_text(mock_form.label(''))
  end

  test "renders errors on the record" do
    targeting = :username

    mock_user = build(:user, { targeting => nil })

    render_component(
      component: Forms::RowComponent,
      props: { name: targeting, record: mock_user, form: mock_form }
    )

    print page.native

    assert_selector('.form-row__errors', count: 1)
    assert_selector('.form-row__errors .form-row__errors__error', count: 1, text: "can't be blank")
  end
end
