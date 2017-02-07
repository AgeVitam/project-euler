#Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#How many such routes are there through a 20×20 grid?

class Integer
	def factorial
		return 1 if self.zero?
		(1..self).inject(:*)
	end
end

size = 20

paths = ((size * 2).factorial) / ((size.factorial)**2)

puts paths

