=begin
It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?
=end
=begin
require 'prime'
$memo = {0 => 1}
def count_coins coins, target, last_coin = 0

	return 1 if target == 0
	total = 0

	coins.each do |c|
		next if c < last_coin
		total += count_coins(coins, target - c, c) if (target >= c)
	end
	puts "#{target} => #{total}"
	total
end
$primes = Prime.each(10)
def count_primes target
	count_coins($primes, target)
end
	
n = 30

until (n > 100) || (count_primes(n) > 5000)
	n+=1
end
 
 puts n
 puts count_primes(n)