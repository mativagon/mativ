puts "Введите длины сторон треугольника:"
a = gets
b = gets
c = gets
sorted_length = [a.to_i, b.to_i, c.to_i].sort
if sorted_length[2] ** 2 == sorted_length[0] ** 2 + sorted_length[1] ** 2
  puts "Треугольник прямоугольный."
elsif sorted_length[0] == sorted_length[1] && sorted_length[1] == sorted_length[2]
  puts "Треугольник равносторонний и равнобедренный."
elsif sorted_length[0] - sorted_length[1] == 0 && sorted_length[1] != sorted_length[2]
  puts "Треугольник равнобедренный."
else
  puts "Треугольник не является равнобедренным, прямоугольным или равносторонним."
end
