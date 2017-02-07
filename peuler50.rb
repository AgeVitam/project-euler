#The prime 41, can be written as the sum of six consecutive primes:
#41 = 2 + 3 + 5 + 7 + 11 + 13
#
#This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
#The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
#Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'prime'

#primes = []
#sums = [0]
#sum = 0
#Prime.each(1000000) do |p|
#	primes.push(p)
#	sum += p
#	sums.push(sum)
#end

#now we've sped things up: primes[x,y].reduce(:+) == sums[x+y]-sums[x]
#and number of terms == y as long as we enforce primes[x,y].length == y
#primes.length.downto(1) do |y|
#	(0..(primes.length - y)).each do |x|
#		break if x+y >= sums.length
#		sum = sums[x+y]-sums[x]
#		if primes.include?(sum)
#			puts sum
#			quit
#		end
#	end
#end

#this never finishes, I don't know why. New approach (stolen from internet cuz fuck it):

primes = Prime.each(10000).to_a
longest = []
primes[0..10].each_with_index { |p, i|
  j = i
  begin
    j += 1
    cons = primes[i..j]
    sum = cons.reduce(:+)
    if sum.prime? && cons.length > longest.length
      longest = cons
    end
  end while sum < 1000000
}
puts longest.reduce(:+)