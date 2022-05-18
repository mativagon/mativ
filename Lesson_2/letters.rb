letters = ['a', 'e', 'i', 'o', 'u', 'y']
final_hash = {}

letters.each do |l|
  final_hash[l] = l.ord - 96
end
puts final_hash


