# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validating'

class Route
  include InstanceCounter
  include Validating

  attr_reader :stations, :name

  NAME_SAMPLE = /^([a-z]|\d){3,}$/i.freeze

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

  protected

  def validate!
    raise 'Название маршрута должно содержать не менее 3 символов и состоять из букв и цифр!' if name !~ NAME_SAMPLE
    raise 'Нет такой начальной или конечной станции!' unless first_station.is_a?(Station) || last_station.is_a?(Station)
  end
end
