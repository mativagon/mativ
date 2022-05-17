puts "Введите длины сторон треугольника:"
a = gets.to_i
b = gets.to_i
c = gets.to_i

sorted_length = [a, b, c].sort

if sorted_length[2] ** 2 == sorted_length[0] ** 2 + sorted_length[1] ** 2
  puts "Треугольник прямоугольный."
elsif sorted_length[0] == sorted_length[1] && sorted_length[1] == sorted_length[2]
  puts "Треугольник равносторонний и равнобедренный."
elsif sorted_length[0] - sorted_length[1] == 0 && sorted_length[1] != sorted_length[2]
  puts "Треугольник равнобедренный."
else
  puts "Треугольник не является равнобедренным, прямоугольным или равносторонним."
end
