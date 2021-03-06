=begin
Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are all figurate (polygonal) numbers and are generated by the following formulae:
Triangle 	  	P3,n=n(n+1)/2 	  	1, 3, 6, 10, 15, ...
Square 	  	P4,n=n2 	  	1, 4, 9, 16, 25, ...
Pentagonal 	  	P5,n=n(3n-1)/2 	  	1, 5, 12, 22, 35, ...
Hexagonal 	  	P6,n=n(2n-1) 	  	1, 6, 15, 28, 45, ...
Heptagonal 	  	P7,n=n(5n-3)/2 	  	1, 7, 18, 34, 55, ...
Octagonal 	  	P8,n=n(3n-2) 	  	1, 8, 21, 40, 65, ...

The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three interesting properties.

	The set is cyclic, in that the last two digits of each number is the first two digits of the next number (including the last number with the first).
	Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and pentagonal (P5,44=2882), is represented by a different number in the set.
	This is the only set of 4-digit numbers with this property.

Find the sum of the only ordered set of six cyclic 4-digit numbers for which each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal, is represented by a different number in the set.
=end

triangles,squares,pentagons,hexagons,heptagons,octagons = [0],[0],[0],[0],[0],[0]
n = 1
while triangles.last < 10000
	triangles.push((n*(n+1))/2)
	n += 1
end
triangles.delete_if{|x| x < 1000 or x > 9999}
n = 1
while squares.last < 10000
	squares.push(n**2)
	n += 1
end
n = 1
squares.delete_if{|x| x < 1000 or x > 9999}
while pentagons.last < 10000
	pentagons.push((n*((3*n)-1))/2)
	n += 1
end
n = 1
pentagons.delete_if{|x| x < 1000 or x > 9999}
while hexagons.last < 10000
	hexagons.push(n*((2*n)-1))
	n += 1
end
n = 1
hexagons.delete_if{|x| x < 1000 or x > 9999}
while heptagons.last < 10000
	heptagons.push((n*((5*n)-3))/2)
	n += 1
end
n = 1
heptagons.delete_if{|x| x < 1000 or x > 9999}
while octagons.last < 10000
	octagons.push(n*((3*n)-2))
	n += 1
end
octagons.delete_if{|x| x < 1000 or x > 9999}

$polygons = [triangles,squares,pentagons,hexagons,heptagons,octagons]

(0..5).each do |i|
	$polygons.each do |j|
		next if $polygons[i] == j
		$polygons[i] -= j
	end
end

#def isin(num,polygons)
#	polygons.each_index do |i|
#		return i if polygons[i].include?(num)
#	end
#	false
#end

$answer = [0,0,0,0,0,0] #each index is a figurate number type, starting with triangle

def findnext(prev,length)
	(0..5).each do |i|
		next unless $answer[i] == 0
		(0...($polygons[i].length)).each do |j|
			next if $answer.include?($polygons[i][j])
			if ($polygons[i][j] / 100) == ($answer[prev] % 100)
				$answer[i] = $polygons[i][j]
				return true if (length == 5) and (($answer[5] / 100) == ($answer[i] % 100))
				return true if (findnext(i,length+1))
			end
		end
		$answer[i] = 0
	end
	false
end

(0...($polygons[5].length)).each do |i|
	$answer[5] = $polygons[5][i]
	break if findnext(5,1)
end
p $answer
puts
puts $answer.reduce(:+)