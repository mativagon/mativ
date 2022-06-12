# frozen_string_literal: true

require_relative 'modules/coach_capacity'

class PassengerCoach < Coach
  include CoachCapacity

  attr_accessor :busy

  def initialize(number, capacity)
    super
    @type = 'passenger'
    @busy = 0
  end
end
