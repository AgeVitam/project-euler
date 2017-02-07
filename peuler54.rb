#The file, peuler54_poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
#
#How many poker hands does Player 1 win?


#there is probably an easier way to do this, but this is a fully functional poker hand parser
class Hand
	include Comparable
	attr_reader :cards, :rank, :values
	def initialize(cards)
		@cards = cards
		@straight = true
		@flush = true
		suit = @cards[0][1]
		@values = []
		@cards.each do |card|
			if card[0] =~ /\d/ 
				@values << card[0].to_i
			elsif card[0] == 'T'
				@values << 10
			elsif  card[0] == 'J'
				@values << 11
			elsif card[0] == 'Q'
				@values << 12
			elsif card[0] == 'K'
				@values << 13
			else # Ace
				@values << 14
			end
			@flush = false if card[1] != suit
		end
		@values.sort.each_with_index{|card,i| @straight = false unless card - i == @values.sort[0]}
		if @straight == false and @values.include?(14)
			@straight = true
			@values.map {|c| c == 14 ? 1 : c}.sort.each_with_index{|card,i| @straight = false unless card - i == @values.sort[0]}
			@values = @values.map {|c| c == 14 ? 1 : c } if @straight
		end
		if @straight
			@flush ? @rank = 9 : @rank = 5 #straight flush or straight
		elsif @flush
			@rank = 6  #flush
		elsif @values.uniq.length == 2 #full house or four of a kind
			(@values.count(@values.uniq[0]) == 4 or @values.count(@values.uniq[1]) == 4) ? @rank = 8 : @rank = 7
		elsif @values.uniq.length== 3 #three of a kind or two pair
			@rank = 3
			@values.uniq.each {|v| @rank = 4 if @values.count(v) == 3}
		elsif @values.uniq.length== 4
			@rank = 2 #pair
		else
			@rank = 1 #high card
		end
	end	

	def <=>(otherhand)
		@comp = self.rank <=> otherhand.rank
		return @comp unless @comp == 0
		return self.values.sort.reverse <=> otherhand.values.sort.reverse if self.values.uniq.length == 5
		if self.values.uniq.length == 2
			@comp = self.values.select{|c| self.values.count(c)>2}.uniq <=> otherhand.values.select {|c| otherhand.values.count(c)>2}.uniq
			return @comp unless @comp == 0
			return self.values.select {|c| self.values.count(c)<3}.uniq <=> otherhand.values.select {|c| otherhand.values.count(c)<3}.uniq
		end 
		if self.values.uniq.length == 3
			@comp = self.values.select{|c| self.values.count(c)>1}.uniq.sort.reverse <=> otherhand.values.select{|c| otherhand.values.count(c)>1}.uniq.sort.reverse
			return @comp unless @comp == 0
			return self.values.select {|c| self.values.count(c)==1}.sort.reverse <=> otherhand.values.select {|c| otherhand.values.count(c) == 1}.sort.reverse
		end
		@comp = self.values.select {|c| self.values.count(c)==2}.uniq <=> otherhand.values.select {|c| otherhand.values.count(c)==2}.uniq
		return @comp unless @comp == 0
		self.values.select{|c| self.values.count(c)==1}.sort.reverse <=> otherhand.values.select{|c| otherhand.values.count(c)==1}
	end
end
hands = []
File.new('peuler54_poker.txt').each {|line| 
	arr = []
	arr.push hand1 = Hand.new(line.split[0,5])
	arr.push hand2 = Hand.new(line.split[5,5])
	hands.push arr
}
ans = 0
hands.each {|h| ans += 1 if h[0] > h[1]}
puts ans

	
#the rest is just for fun

#deck = []
#s = 'C'
#4.times do |_|
#	(2..14).each do |v|
#		if v < 10
#			card = v.to_s
#		elsif v == 10
#			card = "T"
#		elsif v == 11
#			card = "J"
#		elsif v == 12
#			card = "Q"
#		elsif v == 13
#			card = "K"
#		elsif v == 14
#			card = "A"
#		end
#		deck.push card + s
#	end
#	if s == 'C'
#		s = 'D'
#	elsif s == 'D'
#		s = 'H'
#	elsif s == 'H'
#		s = 'S'
#	end
#end

#loop do
	#shuffle a deck, make a two player texas hold em hand, show both hands and declare a winner
	# hitting enter does it all again
	