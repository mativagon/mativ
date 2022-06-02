# frozen_string_literal: true

class CargoCoach < Coach
  def initialize(number)
    super
    @type = 'cargo'
  end
end
