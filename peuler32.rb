#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
#The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
#Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

products = []
nines = (1..9).to_a.permutation.to_a
nines.each do |arr|
	prod = arr[5,4].join.to_f 
	products.push prod if prod / arr[2,3].join.to_f == arr[0,2].join.to_f
	products.push prod if prod / arr[1,4].join.to_f == arr[0].to_f
end

puts products.uniq.reduce(:+).to_i