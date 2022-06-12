# frozen_string_literal: true

require_relative 'modules/coach_capacity'

class CargoCoach < Coach
  include CoachCapacity

  attr_accessor :busy

  def initialize(number, capacity)
    super
    @type = 'cargo'
    @busy = 0
  end
end
