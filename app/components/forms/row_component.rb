# frozen_string_literal: true

class Forms::RowComponent < ViewComponent::Base
  def initialize(errors:)
    @errors = errors
  end
end
