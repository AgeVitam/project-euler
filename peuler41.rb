#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
#What is the largest n-digit pandigital prime that exists?

require 'prime'
start = Time.now
pandigitals = []
#this works slowly. Only need to check 7 digit numbers!
(2..9).each {|n| pandigitals.push (1..n).to_a.permutation(n).to_a}

pandigitalprimes = []

pandigitals.each {|length| length.each {|num| pandigitalprimes.push(num.join.to_i) if Prime.prime?(num.join.to_i)}}

puts pandigitalprimes.max
puts "#{((Time.now - start)*1000).to_i} ms" #3600 ms for 2..9, 440 ms for 2..7 