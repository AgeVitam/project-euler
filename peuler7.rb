def prime? x
(2..x-1).each { |y| return false if x % y == 0 }
true
end
 
x = 10_001 # We look for 10 001st prime number
n = 3 # Start at 3 so we can skip even numbers
counter = 1 # Counter at 1 because 2 is prime number
 
while true
counter += 1 if prime? n
break if counter == x
n += 2 # We can skip the odd numbers
end
 
puts "The answer is #{n}." 