=begin
Euler's Totient function, phi(n) [sometimes called the phi function], is used to
determine the number of numbers less than n which are relatively prime to n. For 
example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to 
nine, phi(9)=6.

n	Relatively Prime 	phi(n) 	n/phi(n)
2 	1 				1 		2
3 	1,2 				2	 	1.5
4 	1,3		 		2	 	2
5 	1,2,3,4		 	4	 	1.25
6 	1,5 				2 		3
7 	1,2,3,4,5,6 		6	 	1.1666...
8 	1,3,5,7 			4	 	2
9 	1,2,4,5,7,8 		6 		1.5
10 	1,3,7,9 			4	 	2.5

It can be seen that n=6 produces a maximum n/phi(n) for n <= 10.

Find the value of n <= 1,000,000 for which n/phi(n) is a maximum.
=end

#"relatively prime" aka coprime means  numbers where gcd is 1
require 'prime'

=begin
def phi (num) #phi function from wikipedia
	@divisors = Prime.prime_division(num).collect{|a|a[0]}
	(num * (@divisors.collect{|d| (1-("1/#{d}".to_r))}.reduce(:*))).to_i
end

answer = 0
max = 0
quotient = 0

(500000..1000000).each do |n| #reduced range because answer took more than a minute (just barely)
	quotient = (n/phi(n).to_f)
	if quotient > max
		max = quotient
		answer = n
	end
end

puts answer
=end

#turns out there's a much easier solution than that:

n = 1

Prime.each{|p|
	break if n * p > 1000000
	n *=p
}

puts n

#not even sure why this works tbh but it's basically because math