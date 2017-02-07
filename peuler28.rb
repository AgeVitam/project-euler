#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

#21 22 23 24 25
#20  7  8  9 10
#19  6  1  2 11
#18  5  4  3 12
#17 16 15 14 13
#
#It can be verified that the sum of the numbers on the diagonals is 101.
#
#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

#side length of each square is each odd number
#top right of each square is sidelength**2
#each other corner is top right - length - 1

length = 3
sum = 1
while length <= 1001
	sum += length**2
	(1..3).each {|n| sum += (length**2)-(n*(length-1))}
	length += 2
end

puts sum