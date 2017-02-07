=begin


Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d <= 8 in ascending order of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that there are 21 elements in this set.

How many elements would be contained in the set of reduced proper fractions for d <= 1,000,000?
=end

#okay, find a pattern:

# d <= 1 ? ans == 0
# d <= 2 ? ans == 1
# d <= 3 ? ans == 3
# d <= 4 ? ans == 5
# d <= 5 ? ans == 9
# d <= 6 ? ans == 11
# d <= 7 ? ans == 17
# d <= 8 ? ans == 21

#nothing obvious :( let's automate this.

#hcf == gcd
=begin
rpf = []

(2..100).each {|d|
	(1...d).each {|n|
		next if rpf.include?(Rational(n,d))
		rpf << Rational(n,d) if n.gcd(d) == 1
	}
}

numelems = ['null',0]
(2..100).each {|d|
	numelems << rpf.select{|r| r.denominator <= d}.length
}

numelems.each_index {|i|
	puts "there are #{numelems[i]} elements when d <= #{i}"
}
=end

#this returns 0,1,3,5,9,11,17,21,27,31,41,45,57,63,71,79,95,101,119,127 which is defined by:
#sum(phi(i), i=1..n)
#this will require a sieve for solving euler's totient function (which I did for an earlier problem but idk)
