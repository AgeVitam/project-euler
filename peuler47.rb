#The first two consecutive numbers to have two distinct prime factors are:
#
#14 = 2 � 7
#15 = 3 � 5
#
#The first three consecutive numbers to have three distinct prime factors are:
#
#644 = 2� � 7 � 23
#645 = 3 � 5 � 43
#646 = 2 � 17 � 19.
#
#Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
require 'prime'
start = Time.now

consec = []
n = 2

until consec.length == 4
	Prime.prime_division(n).length == 4 ? consec.push(n) : consec = []
	n += 1
end
puts consec
puts "#{((Time.now-start)*1000).to_i} ms elapsed."