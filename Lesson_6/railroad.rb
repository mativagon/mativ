# frozen_string_literal: true

class Railroad
  def initialize
    @railroad_stations = []
    @railroad_trains = []
    @railroad_routes = []
    @railroad_coaches = []
  end

  def create_station
    puts 'Введите название станции, состоящее из букв и цифр:'
    station_name = gets.chomp.to_s

    if find_station(station_name)
      puts 'Такая станция уже существует'
      return
    end

    @railroad_stations << Station.new(station_name)
    puts "Станция #{station_name} создана."
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train
    puts 'Какой поезд вы хотите создать?'
    puts '1. Пассажирский'
    puts '2. Грузовой'

    input = gets.to_i

    case input
    when 1
      puts 'Введите номер поезда:'
      train_number = gets.chomp.to_s

      if find_train(train_number)
        puts 'Такой поезд уже существует.'
        return
      end

      @railroad_trains << PassengerTrain.new(train_number)
      puts "Поезд #{train_number} создан."
    when 2
      puts 'Введите номер поезда:'
      train_number = gets.chomp.to_s

      if find_train(train_number)
        puts 'Такой поезд уже существует.'
        return
      end

      @railroad_trains << CargoTrain.new(train_number)
      puts "Поезд #{train_number} создан."
    else
      puts 'Неверный ввод, введите число от 1 до 2!'
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_route
    puts 'Введите название маршрута:'
    name = gets.chomp.to_s

    if find_route(name)
      puts 'Такой маршрут уже существует.'
      return
    end

    puts 'Введите название первой станции:'
    first_station_name = gets.chomp.to_s

    puts 'Введите название конечной станции:'
    last_station_name = gets.chomp.to_s

    first_station = find_station(first_station_name)
    last_station = find_station(last_station_name)

    @railroad_routes << Route.new(first_station, last_station, name)
    puts "Маршрут #{name} создан."
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_station_to_route
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s

    puts 'Введите название маршрута, в который хотите добавить станцию:'
    route_name = gets.chomp.to_s

    station = find_station(station_name)
    route = find_route(route_name)

    if route
      route.add_station(station)
      puts "В маршрут #{route_name} добавлена станция #{station_name}."
    else
      puts 'Нет такого маршрута!'
    end
  end

  def delete_station_from_route
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s

    puts 'Введите название маршрута, из которого хотите удалить станцию:'
    route_name = gets.chomp.to_s

    station = find_station(station_name)
    route = find_route(route_name)

    if route && station
      route.remove_station(station)
      puts "Из маршрута #{route_name} удалена станция #{station_name}."
    else
      puts 'Не существует такого маршрута или станции!'
    end
  end

  def train_set_route
    puts 'Введите номер поезда:'
    train_number = gets.chomp.to_s

    puts 'Введите название маршрута:'
    route_name = gets.chomp.to_s

    train = find_train(train_number)
    route = find_route(route_name)
    train.set_route(route)
    puts "Маршрут #{route_name} присвоен поезду #{train_number}."
  end

  def show_stations
    @railroad_stations.each do |station|
      print "Станция - #{station.name} "
      station.trains.each { |train| print "Поезд - #{train.number} " }
      puts
    end
  end

  def create_coach
    puts 'Какой вагон вы хотите создать?'
    puts '1. Пассажирский'
    puts '2. Грузовой'

    input = gets.to_i

    case input
    when 1
      puts 'Введите номер вагона:'
      coach_number = gets.chomp.to_s

      if find_coach(coach_number)
        puts 'Такой вагон уже существует.'
        return
      end

      @railroad_coaches << PassengerCoach.new(coach_number)
      puts "Вагон #{coach_number} создан."
    when 2
      puts 'Введите номер вагона:'
      coach_number = gets.chomp.to_s

      if find_coach(coach_number)
        puts 'Такой вагон уже существует.'
        return
      end

      @railroad_coaches << CargoCoach.new(coach_number)
      puts "Вагон #{coach_number} создан."
    else
      puts 'Неверный ввод, введите число от 1 до 2!'
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def train_coach_hitch
    puts 'Введите номер вагона.'
    coach_number = gets.to_s

    puts 'Введите номер поезда, к которому хотите прицепить вагон.'
    train_number = gets.to_s

    coach = find_coach(coach_number)
    train = find_train(train_number)

    if train && coach
      if train.coach_hitch(coach)
        puts "Вагон #{coach_number} прицеплен к поезду #{train_number}."
      else
        puts 'Тип вагона и поезда не совпадает!'
      end
    else
      puts 'Не существует такого поезда или вагона!'
    end
  end

  def train_coach_unhitch
    puts 'Введите номер вагона.'
    coach_number = gets.to_s

    puts 'Введите номер поезда, от которого хотите отцепить вагон.'
    train_number = gets.to_s

    coach = find_coach(coach_number)
    train = find_train(train_number)

    if train && coach
      train.coach_unhitch(coach)
      puts "Вагон #{coach_number} отцеплен от поезда #{train_number}."
    else
      puts 'Не существует такого поезда или вагона!'
    end
  end

  def train_move
    puts 'Куда ехать поезду?'
    puts '1. Вперед'
    puts '2. Назад'

    input = gets.to_i

    puts 'Введите номер поезда:'

    train_number = gets.to_s
    train = find_train(train_number)

    case input
    when 1
      if train
        if train.current_station == train.route.last_station
          puts "Поезд #{train_number} на конечной станции!"
        else
          train.move_forward
          puts "Поезд #{train_number} прибыл на следующую станцию!"
        end
      else
        puts 'Такого поезда не существует!'
      end
    when 2
      if train
        if train.current_station == train.route.first_station
          puts "Поезд #{train_number} на первой станции!"
        else
          train.move_back
          puts "Поезд #{train_number} прибыл на предыдущую станцию!"
        end
      end
    else
      puts 'Неверный ввод, введите число от 1 до 2!'
    end
  end

  def menu
    puts 'Введите пункт меню в соответствии с тем, какую операцию нужно произвести.'
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать маршрут'
    puts '4. Добавить станцию в маршрут'
    puts '5. Удалить станцию из маршрута'
    puts '6. Назначить маршрут поезду'
    puts '7. Создать вагон'
    puts '8. Прицепить вагон к поезду'
    puts '9. Отцепить вагон от поезда'
    puts '10. Переместить поезд по маршруту'
    puts '11. Просмотреть список станций и поездов находящихся на них'
    puts '12. Выход'
  end

  private

  def find_station(name)
    @railroad_stations.find { |station| station.name == name }
  end

  def find_route(name)
    @railroad_routes.find { |route| route.name == name }
  end

  def find_coach(number)
    @railroad_coaches.find { |coach| coach.number == number }
  end

  def find_train(number)
    @railroad_trains.find { |train| train.number == number }
  end
end
