fib = [1,2]
n = 3
while n < 4_000_000
	fib << n
	n = fib[-1]+fib[-2]
end

puts fib.select{|f| f.even?}.reduce(:+)
