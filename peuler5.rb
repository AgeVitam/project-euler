works = false
n = 2520
until works
	n += 20
	works = true
	(2..20).each {|m| works = false unless (n%m==0)}
end

puts n