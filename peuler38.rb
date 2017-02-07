#Take the number 192 and multiply it by each of 1, 2, and 3:
#
#    192 × 1 = 192
#    192 × 2 = 384
#    192 × 3 = 576
#
#By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
#
#The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
#
#What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

#the mulitplicand will start with 9.
#the products have to concatenate to 9 digits.
#Could be one 4-digit and one 5-digit number.

class Integer
	def pandigital?
		digits = self.to_s.each_char.to_a.sort.join
		digits == '123456789'
	end
end

panfours = (1..9).to_a.permutation(4).map {|a|
	next unless a[0] == 9
	a.join.to_i
}.compact

pandigitals = []

panfours.each do |n|
	test = (n.to_s + (n*2).to_s).to_i
	next if test.to_s.length != 9
	pandigitals.push test if test.pandigital?
end

puts pandigitals.max
