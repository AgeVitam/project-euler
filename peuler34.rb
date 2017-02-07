#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
#Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.

class Integer
	def factorial
		raise TypeError, 'unable to factorialize negative number!' if self < 0
		return 1 if self == 0
		self.downto(1).reduce(:*)
	end
	
	def curious?
		sum = 0
		self.to_s.chars.each{|n| sum += n.to_i.factorial}
		self == sum
	end
end

digifact = (1..9).map{|i| i.factorial}
curious = []

((digifact.reduce(:+)).downto(3)).each do |i|
	curious.push i if i.curious?
end

puts curious.reduce(:+)