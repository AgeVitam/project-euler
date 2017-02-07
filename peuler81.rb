=begin
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, 
by only moving to the right and down, is indicated in bold red and is equal to 2427.

-131- 	673	 	234		103	 	18
-201-  	-96-		-342- 	965 		150
630 		803		-746- 	-422-	111
537		699 		497 		-121- 	956
805	 	732		524		-37-		-331-

Find the minimal path sum, in matrix.txt (right click and "Save Link/Target As..."), a 
31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only 
moving right and down.
=end

matrix = []
File.open("peuler81_matrix.txt","r") {|file|
	file.each_line{|line| matrix.push line.chomp.split(',').map{|n|n.to_i}}
}

#let's repurpose the solution to peuler18 and peuler67
#basically, add to each cell the minimal sum of the path to the bottom right, starting at the bottom right

#first add the path sum for the bottom row
(matrix[-1].length - 2).downto(0) {|columni| matrix[-1][columni] += matrix[-1][(columni + 1)]}

#then do the same for the rightmost column
(matrix.length - 2).downto(0){|rowi| matrix[rowi][-1] += matrix[(rowi + 1)][-1]}

#then do it for the rest
(matrix.length - 2).downto(0) {|rowi|
	(matrix[rowi].length - 2).downto(0) {|columni|
		matrix[rowi][columni] += [matrix[(rowi + 1)][columni],matrix[rowi][(columni + 1)]].min
	}
}

puts matrix[0][0] #this now contains the minimum path sum