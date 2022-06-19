# frozen_string_literal: true

require_relative 'modules/manufacturer'
require_relative 'modules/validating'

class Coach
  include Manufacturer
  include Validating

  attr_reader :type, :number

  validate :number, :presence
  validate :number, :type, String

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
end
