# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validating'

class Route
  include InstanceCounter
  include Validating

  attr_reader :stations, :name

  validate :name, :presence
  validate :name, :type, String

  def initialize(first_station, last_station, name)
    @stations = [first_station, last_station]
    @name = name
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    raise 'Нельзя удалять начальную и конечную станции маршрута!' if @stations[0] == station || @stations[-1] == station

    @stations.delete(station)
  end

  def view_stations
    @stations.each { |station| puts station }
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end
end
