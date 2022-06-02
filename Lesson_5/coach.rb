# frozen_string_literal: true

require_relative 'modules/manufacturer'

class Coach
  include Manufacturer

  attr_reader :type, :name, :number

  def initialize(number)
    @number = number
    @type = nil
  end
end
