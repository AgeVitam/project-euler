arr = []
(2..295245).each do |n|
	sum = 0
	n.to_s.each_char {|c| sum += c.to_i**5}
	arr.push n if sum == n
end

puts arr.reduce(:+)