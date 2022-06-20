# frozen_string_literal: true

require_relative 'modules/manufacturer'
require_relative 'modules/instance_counter'
require_relative 'modules/validating'
require_relative 'modules/accessors'

class Train
  include Manufacturer
  include InstanceCounter
  include Validating
  extend Accessors

  NUMBER_SAMPLE = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze

  attr_reader :coaches, :speed, :current_station, :type, :route, :number

  attr_accessor_with_history :var1, :var2
  strong_attr_accessor :var3, String

  validate :number, :presence
  validate :number, :format, NUMBER_SAMPLE

  def initialize(number)
    @number = number
    @speed = 0
    @coaches = []
    validate!
    register_instance
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def coach_hitch(coach)
    return unless coach.type == @type

    @coaches << coach if @speed.zero?
  end

  def coach_unhitch(coach)
    @coaches.delete(coach) if @speed.zero?
  end

  def route_to_train(route)
    @route = route
    @route.first_station.train_in(self)
    @current_station = @route.first_station
  end

  def move_forward
    return if @current_station == @route.last_station

    @speed = 50
    @current_station.train_out(self)
    next_station.train_in(self)
    @current_station = next_station
    stop
  end

  def move_back
    return if @current_station == @route.first_station

    @speed = 50
    @current_station.train_out(self)
    previous_station.train_in(self)
    @current_station = previous_station
    stop
  end

  def each_coach(&block)
    @coaches.each(&block) if block_given?
  end

  protected

  def previous_station
    return if @current_station == @route.first_station

    current_station_index = @route.view_stations.index(@current_station)
    @route.view_stations[current_station_index - 1]
  end

  def next_station
    return if @current_station == @route.last_station

    current_station_index = @route.view_stations.index(@current_station)
    @route.view_stations[current_station_index + 1]
  end
end
