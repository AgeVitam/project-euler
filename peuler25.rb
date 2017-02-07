n = 3
n1 = 2
n2 = 1
index = 4
while n.to_s.length <1000
	n,n1,n2 = n+n1,n,n1
	index += 1
end

puts index