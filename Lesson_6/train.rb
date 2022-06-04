# frozen_string_literal: true

require_relative 'modules/manufacturer'
require_relative 'modules/instance_counter'
require_relative 'modules/validating'

class Train
  include Manufacturer
  include InstanceCounter
  include Validating

  attr_reader :coaches, :speed, :current_station, :type, :route, :number

  @@trains = []
  NUMBER_SAMPLE = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i

  def initialize(number)
    @number = number
    @speed = 0
    @coaches = []
    validate!
    @@trains.push(self)
    register_instance
  end

  def validate!
    raise 'Не введён номер поезда!' if number.length < 1
    raise 'Номер поезда должен содержать не менее 5 символов!' if number.length < 5
    raise 'Номер поезда должен соответствовать шаблону!' if number !~ NUMBER_SAMPLE
  end

  class << self
    def all
      @@trains
    end

    def find(number)
      @@trains.find { |train| train.number == number }
    end
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

  def set_route(route)
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
