puts "Введите три коэффициента: "
a = gets.to_i
b = gets.to_i
c = gets.to_i

d = b ** 2 - 4 * a * c

if d > 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "Дискриминант равен #{d}. Корни: #{x1}, #{x2}."
elsif d == 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  puts "Дискриминант равен #{d}. Корень: #{x1}."
else
  puts "Дискриминант равен #{d}. Корней нет."
end
