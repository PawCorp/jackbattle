# frozen_string_literal: true

class Forms::RowComponent < ViewComponent::Base
  def initialize(name: nil, record: nil, form:, variant: 'full')
    raise "Name is not a symbol, it should be a key for a property in :record" unless name.nil? || name.is_a?(Symbol)
    raise "Record is nil or not an active record, it's ancestors are #{record.class.ancestors.join ' > '}" unless record.nil? || record.is_a?(ActiveRecord::Base)

    @name = name
    @record = record
    @form = form
    @variant = variant
  end
end
