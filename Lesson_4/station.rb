# frozen_string_literal: true

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_in(train)
    @trains << train unless @trains.include?(train)
  end

  def train_out(train)
    @trains.delete(train)
  end

  def train_list
    puts @trains
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end
end
