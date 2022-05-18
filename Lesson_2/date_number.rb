puts "Введите число месяца: "
day = gets.to_i
puts "Введите месяц:"
month = gets.to_i
puts "Введите год:"
year = gets.to_i

if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  yeardays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
else
  yeardays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end
puts yeardays
day_in_year = yeardays.first(month - 1).sum + day

puts "Номер даты по порядку: #{day_in_year}"