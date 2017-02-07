class Integer
	def ispal?
		self.to_s == self.to_s.reverse
	end
end

pals = []

(900..999).each {|i|
	(900..999).each {|j|
		next if j == i
		pals << (i * j) if (i * j).ispal?
	}
}

puts pals.max