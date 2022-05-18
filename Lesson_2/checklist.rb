puts "После добавления всех товаров введите слово 'стоп'"

checklist = {}
final_price = 0

loop do
  puts "Введите название товара:"
  product = gets.chomp.to_s

  break if product == "стоп"

  puts "Введите цену за единицу товара:"
  price = gets.chomp.to_i

  puts "Введите количество товара:"
  quantity = gets.chomp.to_f

  checklist[product] = {price: price, quantity: quantity}

end

checklist.each do |product, total_price|
  total = total_price[:price] * total_price[:quantity]
  final_price += total

  puts "Название товара: #{product}, стоимость: #{total}"

end

puts "Итоговая стоимость товаров: #{final_price} рублей."