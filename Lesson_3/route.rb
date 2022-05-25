class Route
  def initialize(firstst, lastst)
    @stations_ls = [firstst, lastst]
  end

  def add_station(station)
    @stations_ls.insert(-2, station)
  end

  def rm_station(station)
    if @stations_ls[0] == station || @stations_ls[-1] == station
      puts "Нельзя удалять начальную и конечную станции маршрута!"
    else
      station_index = @stations_ls.index(station)
      @stations_ls.delete_at(station_index)
    end
  end

  def station_list
    @stations_ls.each {|station| puts station}
  end

  def first_st
    @stations_ls.first
  end

  def last_st
    @stations_ls.last
  end
end