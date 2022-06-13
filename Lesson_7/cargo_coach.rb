# frozen_string_literal: true

class CargoCoach < Coach

  attr_accessor :used_place

  def initialize(number, capacity)
    super
    @type = 'cargo'
  end

  def take_place(volume)
    raise 'Недостаточно места' if self.free_place < volume
    @used_place += volume
  end
end
