# frozen_string_literal: true

require_relative 'modules/manufacturer'
require_relative 'modules/validating'

class Coach
  include Manufacturer
  include Validating

  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = nil
    validate!
  end

  def validate!
    raise 'Номер вагона должен содержать не менее 3 символов!' if number.length < 3
  end
end
