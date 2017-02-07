=begin
Let p(n) represent the number of different ways in which n coins can be separated 
into piles. For example, five coins can be separated into piles in exactly seven 
different ways, so p(5)=7.

OOOOO
OOOO   O
OOO   OO
OOO   O   O
OO   OO   O
OO   O   O   O
O   O   O   O   O

Find the least value of n for which p(n) is divisible by one million.
=end


#p(k) = p(k-1) + p(k - 2) - p(k - 5) - p(k - 7) + p(k - 12) + p(k - 15) - p(k - 22)...
#where p(0) = 1 and p(n) = 0 for n < 0 and the numbers subtracted from k are 
#the pentagonal numbers f(k) = (k(3k-1))/2


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
		p[n] = p[n] % 1000000
		i += 1
		(i % 2 == 0) ? (j = (i/2)+1) : (j = (-1*((i/2)+1)))
		penta = j * (3 * j - 1) / 2
	end
	break if p[n] == 0
	n +=1
end
puts n


=begin	
#this took infinitely long even for small values of n, so I memoized it. still takes too long for big values
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


n = 1

until part(n) % 1000000 == 0
	n+=1
end

puts n
=end