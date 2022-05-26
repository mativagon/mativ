class Train
  attr_reader :coaches, :speed, :current_station, :type

  COACH_TYPE = %w[cargo passenger].freeze

  def initialize(number, type, coaches)
    @number = number
    @type = type
    @coaches = coaches
    @speed = 0

    raise "Неверно введен тип поезда!" unless COACH_TYPE.include?(@type)
    raise "Неверно введено количество вагонов, введите число!" unless coaches.is_a?(Integer)
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def coach_hitch
    @coaches += 1 if @speed.zero?
    puts "Вагон прицеплен!"
  end

  def coach_unhitch
    @coaches -= 1 if @speed.zero?
    puts "Вагон отцеплен!"
  end

  def set_route(route)
    @route = route
    @route.first_station.train_in(self)
    @current_station = @route.first_station
    puts "Маршрут добавлен!"
  end

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

  def move_forward
    return if @current_station == @route.last_station

    @speed = 50
    @current_station.train_out(self)
    next_station.train_in(self)
    @current_station = next_station
    stop
    puts "Поезд прибыл на следующую станцию!"
  end

  def move_back
    return if @current_station == @route.first_station

    @speed = 50
    @current_station.train_out(self)
    previous_station.train_in(self)
    @current_station = previous_station
    stop
    puts "Поезд прибыл на предыдущую станцию!"
  end
end