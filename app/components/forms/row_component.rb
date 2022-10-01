# frozen_string_literal: true

class Forms::RowComponent < ViewComponent::Base
  def initialize(name: nil, record: nil, form:, variant: 'full')
    raise "Name is not a symbol, it should be a key for a property in :record" unless name.nil? || name.is_a?(Symbol)
    raise "#{name.to_s} could not be found on #{record.to_s}" unless name.nil? || record.respond_to?(name)

    @name = name
    @record = record
    @form = form
    @variant = variant
  end
end
