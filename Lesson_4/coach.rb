# frozen_string_literal: true

class Coach
  attr_reader :type, :name, :number

  def initialize(number)
    @number = number
    @type = nil
  end
end
