# frozen_string_literal: true

class PassengerCoach < Coach
  def initialize(number)
    super
    @type = 'passenger'
  end
end
