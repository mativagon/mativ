# frozen_string_literal: true

require_relative 'modules/instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations, :name

  @@routes = []

  def initialize(first_station, last_station, name)
    @stations = [first_station, last_station]
    @name = name
    @@routes.push(self)
    register_instance
  end

  def self.all
    @@routes
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if @stations[0] == station || @stations[-1] == station
      puts 'Нельзя удалять начальную и конечную станции маршрута!'
    else
      @stations.delete(station)
    end
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
