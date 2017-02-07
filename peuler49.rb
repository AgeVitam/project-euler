#The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
#There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#
#What 12-digit number do you form by concatenating the three terms in this sequence?

require 'prime'
start = Time.now
n = 3330
Prime.each(9999) do |p|
	next if p <1488
	#(2..((9999-p)/2).to_i).each do |n| #the answer will always be n = 3330
		if (p.to_s.each_char.sort == (p+n).to_s.each_char.sort and p.to_s.each_char.sort == (p+n+n).to_s.each_char.sort) and (Prime.prime?(p+n) and Prime.prime?(p+n+n))
			puts p.to_s+(p+n).to_s+(p+n+n).to_s
			puts "#{((Time.now - start)*1000).to_i} ms elapsed" #7 ms or 2977 ms
			exit
		end
	#end
end
