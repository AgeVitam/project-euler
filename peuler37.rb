#The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#
#Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
#NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'
start = Time.now
class Integer
	def truncatable?
		self.truncl? and self.truncr?
	end
	
	def truncl? #right to left
		return false unless Prime.prime?(self)
		return true if self.to_s.length == 1
		self.to_s.chop.to_i.truncl?
	end
	
	def truncr? #left to right
		return false unless Prime.prime?(self)
		return true if self.to_s.length == 1
		self.to_s[1,self.to_s.length].to_i.truncr?
	end
end

list = []

Prime.each do |p|
	next if p < 8
	break if list.length == 11
	list.push(p) if p.truncatable?
end

puts list.reduce(:+)
puts "#{((Time.now - start)*1000).floor} ms"

#OVER NINE THOUSAND ms, could be faster with a lookup table
#could be even faster by building each number from the single digit primes and then appending 1,3,7,9 and checking if truncr?. 