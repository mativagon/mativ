# frozen_string_literal: true

require_relative 'modules/manufacturer'
require_relative 'modules/validating'

class Coach
  include Manufacturer
  include Validating

  attr_reader :type, :number

  NUMBER_SAMPLE = /^([a-z]|\d){3}$/i.freeze

  def initialize(number, capacity)
    @number = number
    @type = nil
    @capacity = capacity
    @used_place = 0
    validate!
  end

  def free_place
    @capacity - @used_place
  end

  protected

  def validate!
    raise 'Номер вагона должен содержать не менее 3 символов!' if number !~ NUMBER_SAMPLE
  end
end
