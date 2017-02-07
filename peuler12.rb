# Problem 12
# find the first triangle number with over 500 divisors


#make some triangle numbers and test along the way for number of divisors using fancy prime number math
start=Time.now
triangle = 1
num = 2

loop do
	n = triangle
	divisors = 1
	(2..n**0.5).each do |i|
		exp = 1
		while n % i == 0
			n /= i
			exp += 1
		end
		divisors *= exp
	end
	divisors *= 2 if n > 1
	puts "#{triangle} has #{divisors} divisors"
	break if divisors > 500
	triangle += num
	num += 1
end
	
puts "#{(Time.now - start)*1000} ms elapsed"