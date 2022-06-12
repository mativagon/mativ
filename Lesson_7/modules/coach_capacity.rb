# frozen_string_literal: true

module CoachCapacity
  attr_reader :busy, :capacity

  def take_place(quantity)
    raise 'Недостаточно места!' if quantity > self.free_place
    self.busy += quantity
  end

  def free_place
    self.capacity - self.busy
  end
end