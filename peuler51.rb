=begin
By replacing the 1st digit of the 2-digit number *3, it turns out that six of the 
nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit 
number is the first example having seven primes among the ten generated numbers, 
yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. 
Consequently 56003, being the first member of this family, is the smallest prime 
with this property.

Find the smallest prime which, by replacing part of the number (not necessarily 
adjacent digits) with the same digit, is part of an eight prime value family.
=end

require 'prime'

def family?(num)
	numstr = num.to_s
	(0..2).each {|d|
		if numstr.count(d.to_s) >= 3
			arr = []
			arr.push numstr
			misses = 0
			((d+1)..9).each {|r|
				newstr = numstr.gsub(d.to_s,r.to_s)
				Prime.prime?(newstr.to_i) ? arr.push(newstr) : misses += 1
				return false if misses > 2
			}
			if arr.length >= 8
				puts
				p arr
				return true
			end
		end
	}
	false
end

number = 56993
while number += 2
	next unless Prime.prime?(number)
	break if family?(number)
end

puts number