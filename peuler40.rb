#An irrational decimal fraction is created by concatenating the positive integers:
#
#0.123456789101112131415161718192021...
#
#It can be seen that the 12th digit of the fractional part is 1.
#
#If dn represents the nth digit of the fractional part, find the value of the following expression.
#
#d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

champ = ''
n=1
until champ.length >= 1000000
	champ.concat(n.to_s)
	n+=1
end
answer = 1
(0..6).each {|x| answer *= champ[(10**x)-1].to_i}
puts answer