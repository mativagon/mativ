# frozen_string_literal: true

require_relative 'coach'
require_relative 'railroad'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_coach'
require_relative 'passenger_coach'
require_relative 'station'
require_relative 'route'

railroad = Railroad.new
railroad.menu

loop do
  input = gets.to_i
  case input
  when 1
    railroad.create_station
  when 2
    railroad.create_train
  when 3
    railroad.create_route
  when 4
    railroad.add_station_to_route
  when 5
    railroad.delete_station_from_route
  when 6
    railroad.train_set_route
  when 7
    railroad.create_coach
  when 8
    railroad.train_coach_hitch
  when 9
    railroad.train_coach_unhitch
  when 10
    railroad.train_move
  when 11
    railroad.show_stations
  when 12
    break
  else
    puts 'Неверный ввод, введите число от 1 до 12!'
  end
end
