#It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
#
#Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

class Integer
	def permuted?(num)
		self.to_s.each_char.to_a.sort == num.to_s.each_char.to_a.sort
	end
	
	def wins?
		return false if (self*6).to_s.length > self.to_s.length
		return false unless self.permuted?(self*2)
		return false unless self.permuted?(self*3)
		return false unless self.permuted?(self*4)
		return false unless self.permuted?(self*5)
		return false unless self.permuted?(self*6)
		true
	end
end

n = 1
until n.wins?
	n+=1
end

puts n