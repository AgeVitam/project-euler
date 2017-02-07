=begin
The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and 
concatenating them in any order the result will always be prime. For example, 
taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, 
represents the lowest sum for a set of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes concatenate 
to produce another prime.
=end
require 'prime'

class Integer
	def concats?(otherint)
		Prime.prime?((self.to_s + otherint.to_s).to_i) and Prime.prime?((otherint.to_s + self.to_s).to_i)
	end
end

exit #nothing works
remarkable = [3,7,109,673]

Prime.each {|p|
	next if remarkable.include?(p)
	works = true
	remarkable.reverse_each {|r|
		works = false unless r.concats?(p)
		break unless r.concats?(p)
	}
	remarkable.push p if works
	break if works
}

puts
p remarkable
puts
p remarkable.reduce(:+)

#nothing works, cake is a lie