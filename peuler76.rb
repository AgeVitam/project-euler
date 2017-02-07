require 'mathn'

$memo = {0 => 1}

def part(n)
	return 0 if n < 0
	return $memo[n] if $memo.has_key?(n)
	@sum = 0
	(1..n).each do |k|
		@sum += ((-1)**(k+1))*((part(n-("1/2".to_r)*k*((3*k)-1)))+(part(n-("1/2".to_r)*k*((3*k)+1))))
	end
	$memo[n] = @sum
	@sum
end

puts part(100) - 1


=begin
p = [1]
n = 1
i = 0
penta = 0
sign = 0
j = 0

loop do
	i = 0
	penta = 1
	p.push 0
	while penta <= n
		(i % 4 > 1) ? (sign = -1) : (sign = 1)
		p[n] += sign * p[n-penta]
		i += 1
		(i % 2 == 0) ? (j = (i/2)+1) : (j = (-1*((i/2)+1)))
		penta = j * (3 * j - 1) / 2
	end
	break if n == 100
	n +=1
end
puts p[n] - 1 # -1 because the partition [100] doesn't count
=end