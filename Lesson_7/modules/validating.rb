# frozen_string_literal: true

module Validating
  def valid?
    validate!
    true
  rescue
    false
  end
end