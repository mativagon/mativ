# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validating'

class Station
  include InstanceCounter
  include Validating

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
  end

  def train_in(train)
    @trains << train unless @trains.include?(train)
  end

  def train_out(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def train_list
    @trains
  end

  def each_train(&block)
    @trains.each(&block) if block_given?
  end
end
