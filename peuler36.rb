#The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
#Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
#(Please note that the palindromic number, in either base, may not include leading zeros.)

class String
	def palindrome?
		self == self.reverse
	end
end

class Integer
	def dubasepal?
		self.to_s.palindrome? and self.to_s(2).palindrome?
	end
end

list = []

(0...1_000_000).each {|n| list.push n if n.dubasepal?}

puts list.reduce(:+)