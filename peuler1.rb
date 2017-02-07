n=1
mults = []
while ((n * 3) < 1000)
	mults << (n*3)
	mults << (n*5) if (n*5) < 1000
	n += 1
end

puts mults.uniq.reduce(:+)