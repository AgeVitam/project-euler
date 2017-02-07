#It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
#9 = 7 + 2×12
#15 = 7 + 2×22
#21 = 3 + 2×32
#25 = 7 + 2×32
#27 = 19 + 2×22
#33 = 31 + 2×12
#
#It turns out that the conjecture was false.
#
#What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

require 'prime'

class Integer
	def gold?
		Prime.each do |p|
			return false if p > self
			x,y = 1, 0
			while x <= self
				y = p + (2 * (x**2))
				return true if y == self
				x +=1
			end
		end
	end
end

ans = 3

while Prime.prime?(ans) or ans.gold?
	ans += 2
end

puts ans