class Route
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if @stations[0] == station || @stations[-1] == station
      puts "Нельзя удалять начальную и конечную станции маршрута!"
    else
      station_index = @stations.index(station)
      @stations.delete_at(station_index)
    end
  end

  def view_stations
    @stations.each {|station| puts station}
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end
end