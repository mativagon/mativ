# frozen_string_literal: true

module Manufacturer
  def manufacturer=(fabricator)
    self.fabricator = fabricator
  end

  def manufacturer
    fabricator
  end

  private

  attr_accessor :fabricator
end
