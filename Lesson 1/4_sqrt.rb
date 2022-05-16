puts "Введите три коэффициента: "
a = gets
b = gets
c = gets
d = b.to_i ** 2 - 4 * a.to_i * c.to_i
if d > 0
  x1 = (-b.to_i + Math.sqrt(d))/(2 * a.to_i)
  x2 = (-b.to_i - Math.sqrt(d))/(2 * a.to_i)
  puts "Дискриминант равен #{d}. Корни: #{x1}, #{x2}."
elsif d == 0
  x1 = (-b.to_i + Math.sqrt(d))/(2 * a.to_i)
  puts "Дискриминант равен #{d}. Корни: #{x1}."
else
  puts "Дискриминант равен #{d}. Корней нет."
end
