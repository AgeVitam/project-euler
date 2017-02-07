#find abc where a^2 + b^2 = c^2 and a + b + c = 1000

(1..1000).each {|a| 
	(1..1000).each {|b|
		(1..1000).each {|c|
			if ((a**2 + b**2) == c**2) and (a + b + c) == 1000
				puts (a*b*c) 
				Kernel.exit
			end
			}
		}
	}

#this is terribly inefficient, but should work. Fuck math! Guess & check forever!