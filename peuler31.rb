#In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
#    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
#It is possible to make £2 in the following way:
#
#    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
#How many different ways can £2 be made using any number of coins?

def count_coins coins, target, last_coin = 0

	return 1 if target == 0
	total = 0

	coins.each do |c|
		next if c < last_coin
		total += count_coins(coins, target - c, c) if (target >= c)
	end

	total
end

puts count_coins(
	[1,2,5,10,20,50,100,200],
	200
)