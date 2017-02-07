=begin


Consider quadratic Diophantine equations of the form:

x^2 - Dy^2 = 1

For example, when D=13, the minimal solution in x is 649^2 - 13×180^2 = 1.

It can be assumed that there are no solutions in positive integers when D is square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:

3^2 - 2×2^2 = 1
2^2 - 3×1^2 = 1
9^2 - 5×4^2 = 1
5^2 - 6×2^2 = 1
8^2 - 7×3^2 = 1

Hence, by considering minimal solutions in x for D <= 7, the largest x is obtained when D=5.

Find the value of D <= 1000 in minimal solutions of x for which the largest value of x is obtained.
=end

biggestx = 0
ans = 0
(2..1000).each do |d|
	next if ((d.to_f)**(0.5)) % 1 == 0
	x = 0
	begin
		x += 1
		y = ((((x.to_f**2)-1)/d.to_f)**(0.5)).to_f
	end while (y == 0) || (y%1 != 0)
	if x > biggestx
		biggestx = x
		ans = d
	end
end

puts ans
	
#runs forever with no solution :(
#turns out you need continued fractions for this one too wtf
