# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validating'

class Station
  include InstanceCounter
  include Validating

  attr_reader :name, :trains

  NAME_SAMPLE = /^([a-z]|\d){3,}$/i.freeze

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

  protected

  def validate!
    raise 'Название станции должно содержать не менее 3 символов и состоять из букв и цифр!' if name !~ NAME_SAMPLE
  end
end
