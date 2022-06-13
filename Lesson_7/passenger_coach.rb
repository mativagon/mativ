# frozen_string_literal: true

class PassengerCoach < Coach

  attr_accessor :used_place

  def initialize(number, capacity)
    super
    @type = 'passenger'
  end

  def take_place
    raise 'Недостаточно места' if self.free_place < 1
    @used_place += 1
  end
end
