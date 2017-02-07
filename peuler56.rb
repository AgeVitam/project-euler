=begin
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
=end

ans = 0
(1..99).each {|a|
	(1..99).each {|b|
		n = (a**b).to_s.each_char.map{|s|s.to_i}.reduce(:+)
		ans = n if n > ans
	}
}

puts ans

