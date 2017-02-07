=begin


The cube, 41063625 (345**3), can be permuted to produce two other cubes: 
56623104 (384**3) and 66430125 (405**3). In fact, 41063625 is the smallest 
cube which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.
=end

cubes = (5000..9999).map{|i| i**3} #range narrowed by trial and error for fast execution
sortedcubes = cubes.collect {|i| i.to_s.each_char.sort.reduce(:+)}
answer = 0
cubes.each_index {|i|
	answer = cubes[i] 
	break if sortedcubes.count(sortedcubes[i]) == 5
}

p answer