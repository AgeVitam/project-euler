#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, 
#the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum 
#exceeds n.
#
#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the 
#sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 
#28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any 
#further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two
#abundant numbers is less than this limit.
#
#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

#first define some methods
start = Time.now

class Integer
	def pdivisors
		return false if self < 2
		arr = []
		(1..(self**0.5).to_i).each {|n| arr.push(n) if self%n == 0}
		arr.reverse.each {|n| arr.push(self/n)}
		arr.delete(self)
		arr.uniq
	end
	
	def abundant?
		self.pdivisors.reduce(:+) > self
	end
end

#make a list of all the abundant numbers up to 28124 - 12
print 'listing abundant numbers...'
abundants = []
(12..28112).each {|n| abundants.push n if n.abundant?}
lap = Time.now
print "done in #{((Time.now-start)*1000).to_i}ms"
puts

#next build a sieve. True will mean the index IS the sum of two abundants.
print 'listing sums of two abundant numbers...'
sumbuns = Array.new(28123, false)
#populate the array with numbers that are the sum of abundant numbers
(0...(abundants.length)).each { |a|
	abundants[a,(abundants.length-a)].each {|b| 
		sumbuns[((abundants[a]+b)-1)] = true
	}
}
puts "done in #{((Time.now-lap)*1000).to_i}ms"
lap = Time.now

sum = 0
sumbuns.each_index {|i| sum += (i+1) if sumbuns[i] == false}
puts "the answer is #{sum}"
puts "took #{((Time.now-start)*1000).to_i}ms total"