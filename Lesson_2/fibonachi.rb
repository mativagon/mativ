fibonachi = [0, 1]
while fibonachi[-1] + fibonachi[-2] < 100
  fibonachi.push(fibonachi[-1] + fibonachi[-2])
end

puts fibonachi