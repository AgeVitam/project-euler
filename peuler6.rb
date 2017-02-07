puts (((1..100).reduce(:+) ** 2)) - ((1..100).inject(0){|sum,n| sum + (n**2)})
	