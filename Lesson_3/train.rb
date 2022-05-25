class Train
  attr_reader :numb_of_coach, :speed, :current_station, :type

  COACH_TYPE = %w[cargo passenger].freeze

  def initialize(number, type, numb_of_coach)
    @number = number
    @type = type
    @numb_of_coach = numb_of_coach
    @speed = 0

    raise "Неверно введен тип поезда!" unless COACH_TYPE.include?(@type)
    raise "Неверно введено количество вагонов, введите число!" unless numb_of_coach.is_a?(Integer)
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop_train
    @speed = 0
  end

  def coach_hitch
    @numb_of_coach += 1 if @speed.zero?
    puts "Вагон прицеплен!"
  end

  def coach_unhitch
    @numb_of_coach -= 1 if @speed.zero?
    puts "Вагон отцеплен!"
  end

  def add_route(route)
    @route = route
    @route.first_st.train_in(self)
    @current_station = @route.first_st
    puts "Маршрут добавлен!"
  end

  def previous_station
    return if @current_station == @route.first_st

    current_station_index = @route.station_list.index(@current_station)
    @route.station_list[current_station_index - 1]
  end

  def next_station
    return if @current_station == @route.last_st

    current_station_index = @route.station_list.index(@current_station)
    @route.station_list[current_station_index + 1]
  end

  def move_next_station
    return if @current_station == @route.last_st

    @speed = 50
    @current_station.train_out(self)
    next_station.train_in(self)
    @current_station = next_station
    stop_train
    puts "Поезд прибыл на следующую станцию!"
  end

  def move_previous_station
    return if @current_station == @route.first_st

    @speed = 50
    @current_station.train_out(self)
    previous_station.train_in(self)
    @current_station = previous_station
    stop_train
    puts "Поезд прибыл на предыдущую станцию!"
  end
end