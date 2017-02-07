#The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#
#Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
start = Time.now

class Integer
	def triangle?
		tri = self
		n = 1
		while tri > 0
			tri -= n
			n += 1
		end
		tri == 0
	end
end

class String
	def value
		arr = []
		self.upcase.each_codepoint {|c| arr.push (c - 64)}
		arr.reduce(:+)
	end
end

words = []
File.open("peuler42_words.txt","r") do |file|
	file.each_line("\",\"") {|line| words.push line.delete("\"").delete(",")}
end

triangles = []
words.each {|w| triangles.push w if w.value.triangle?}
puts triangles.length

puts "#{((Time.now - start)*1000).to_i} ms" 
