# frozen_string_literal: true

module Validating
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
