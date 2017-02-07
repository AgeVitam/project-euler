#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
#How many circular primes are there below one million?

require 'prime'
start = Time.now
class Integer
	def circular?
		return false unless Prime.prime?(self)
		num = self.rotate
		until num == self
			return false unless Prime.prime?(num)
			num = num.rotate
		end
		true
	end
	
	def rotate
		str = self.to_s
		str.prepend(str[-1]).chop.to_i
	end
	
end
circulars = []
Prime.each(1_000_000) {|p| circulars.push(p) if p.circular?}
puts circulars.length
puts "#{((Time.now - start) * 1000).to_i} ms" #>30 seconds.

#program can be made much more efficient by keeping each prime rotation instead of checking again and again.