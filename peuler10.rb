#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.

#easy version (commented out):
#
#require 'prime'
#
#primes = []
#Prime.each(2000000) {|p| primes.push(p)}
#puts primes.reduce :+

#hard version:
#okay, we'll implement a prime sieve for this one (thanks, wikipedia!).

target = 2000000
list = Array.new(target, true) #start our list of primes
n = 2

#sift out any composite numbers (i.e. non-primes)

list[0] = false #1 isn't a prime (apparently? I'm bad at math)

while n < (target**0.5)
	p = n**2
	if list[n-1]
		while p <= target
			list[p-1] = false
			p += n
		end
	end
	n +=1
end

#use our array of booleans to make an array of primes

primes = []
list.each_index {|i| primes.push (i+1) if list[i] } 

#sum our list of primes

puts primes.reduce(:+)