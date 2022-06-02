# frozen_string_literal: true

require_relative 'modules/instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push(self)
    register_instance
  end

  def self.all
    @@stations
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
