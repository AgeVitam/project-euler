#The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
#
#Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
#
#    d2d3d4=406 is divisible by 2
#    d3d4d5=063 is divisible by 3
#    d4d5d6=635 is divisible by 5
#    d5d6d7=357 is divisible by 7
#    d6d7d8=572 is divisible by 11
#    d7d8d9=728 is divisible by 13
#    d8d9d10=289 is divisible by 17
#
#Find the sum of all 0 to 9 pandigital numbers with this property.

#I'm assuming each triplet needs to be divisible by the exact prime number shown above
#I'm also assuming a number with a starting 0 doesn't count as a 10 digit pandigital
start = Time.now
divisors = [nil,2,3,5,7,11,13,17]

pandigitals = []
(0..9).to_a.permutation.each{|p|pandigitals.push p.join.to_i if p[0] != 0}

list = []
pandigitals.each {|n| list.push n if (1..7).detect {|i| n.to_s[i,3].to_i % divisors[i] != 0} == nil}

puts list.reduce(:+)
puts "#{((Time.now - start)*1000).to_i} ms" #36 full seconds. At least it works.