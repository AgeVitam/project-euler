#The following iterative sequence is defined for the set of positive integers:
#
#n -> n/2 (n is even)
#n -> 3n + 1 (n is odd)
#
#Using the rule above and starting with 13, we generate the following sequence:
#13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
#
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
#Which starting number, under one million, produces the longest chain?
#
#NOTE: Once the chain starts the terms are allowed to go above one million.
start = Time.now
collatz = {} #a lookup table for memoizing our Collatz function

(2...1_000_000).each do |num|
	length = 1
	n = num
	while n != 1
		if collatz.has_key?(n)
			length +=collatz[n]
			n = 1
		else
			n.even? ?	n /= 2 : n = 3 * n + 1
			length +=1
		end
	end
	collatz[num] = length
end

puts "#{collatz.key(collatz.values.max)} has the longest length (#{collatz.values.max}). Took #{(Time.now - start) * 1000} ms."