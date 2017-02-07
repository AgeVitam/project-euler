#The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
#We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
#There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
#If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

curious = []
(10..98).each do |num|
	((num+1)..99).each do |den|
		next if num % 10 == 0 and den % 10 == 0
		
		if num.to_s[0] == den.to_s[1] and num.to_s[1] < den.to_s[0]
			frac2 = [num.to_s[1].to_f,den.to_s[0].to_f]
		elsif num.to_s[1] == den.to_s[0] and num.to_s[0] < den.to_s[1]
			frac2 = [num.to_s[0].to_f,den.to_s[1].to_f]
		else
			next
		end
		
		frac1 = [num,den]
		curious.push(frac1) if (frac1[0].to_f/frac1[1].to_f)==(frac2[0]/frac2[1])
	end
end
total = Rational((curious.reduce(1){|product,f| product * f[0]}),(curious.reduce(1){|product,f| product * f[1]}))
print curious
puts
puts total.denominator