puts "Как Вас зовут?"
name = gets.chomp
puts "Введите Ваш рост:"
height = gets.chomp.to_i
ideal_weight = (height - 110) * 1.15

if ideal_weight < 0
  puts "Ваш вес уже оптимальный."
else
  puts "#{name}, Ваш идеальный вес #{ideal_weight} кг."
end
