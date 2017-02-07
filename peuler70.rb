=begin
Euler's Totient function, phi(n) [sometimes called the phi function], is used to 
determine the number of positive numbers less than or equal to n which are 
relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than 
nine and relatively prime to nine, phi(9)=6.
The number 1 is considered to be relatively prime to every positive number, so 
phi(1)=1.

Interestingly, phi(87109)=79180, and it can be seen that 87109 is a permutation
of 79180.

Find the value of n, 1 < n < 10^7, for which phi(n) is a permutation of n and the
ratio n/phi(n) produces a minimum.
=end

#a bunch of cheatingimeanresearch to get here.
# we're looking for the product of two distinct primes close to sqrt(10_000_000).rounded == 3162
require 'prime'

primes = []

Prime.each {|p|
	next if p < 2000
	break if p >5000
	primes.push p
}

#the phi formula is also simplified because of how we're making the products

def phi(p1,p2)
	(p1-1)*(p2-1)
end

class Integer
	def permutes(otherint)
		self.to_s.each_char.to_a.sort == otherint.to_s.each_char.to_a.sort
	end
end

n=0
answers = []
tots = []
(0...(primes.length - 1)).each {|p1|
	((p1+1)...(primes.length)).each {|p2|
		n = primes[p1]*primes[p2]
		next if n > 10000000
		if n.permutes(phi(primes[p1],primes[p2]))
			answers.push n
			tots.push phi(primes[p1],primes[p2])
		end
	}
}
ans = 0
n = "99999999999999999/1".to_r
(0...(answers.length)).each {|a|
	if "#{answers[a]}/#{tots[a]}".to_r < n
		n = "#{answers[a]}/#{tots[a]}".to_r 
		ans = answers[a]
	end
}

puts ans
