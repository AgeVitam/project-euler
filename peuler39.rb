#If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#
#{20,48,52}, {24,45,51}, {30,40,50}
#
#For which value of p <= 1000, is the number of solutions maximised?

# p = a + b + ((a**2 +b**2)**0.5)

counts = {}
counts.default = 0

(1..499).each do |a|
  (a..499).each do |b|
    break if a + b > 500
    c = (a**2 + b**2)**0.5
    next unless c % 1 == 0
    counts[a + b + c] += 1
  end
end

puts counts.key(counts.each_value.max)

