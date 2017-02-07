=begin
The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
=end

answer = []
(1..50).each do |p| #guessed at range, worked out great
	n = 1
	r = 0
	until r.to_s.length > p
		r = n ** p
		answer.push r if r.to_s.length == p
		n += 1
	end
end

puts answer.length