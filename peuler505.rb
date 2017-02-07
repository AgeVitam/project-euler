$x = {}
$y = {}
$a = {}


def x(n)
	raise ArgumentError, 'n must be greater than 1 in x(n)' if n < 0
	return n if (n == 0) || (n == 1)
	return $x[n] if $x.has_key?(n)
	if n % 2 == 0
		k = n/2
		ans = ((3*(x(k)))+(2*(x(k/2)))) % (2**60)
		$x[n] = ans
	else 
		k = (n - 1)/2
		ans = ((2*(x(k)))+(3*(x(k/2)))) % (2**60)
		$x[n] = ans
	end
	ans
end

def y(n,k)
	if $y.has_key?(n) and $y[n].has_key?(k)
		return $y[n][k]
	end
	(k >= n) ? (ans = x(k)) : (ans = ((2**60)-1-[(y(n,(2*k))),(y(n,((2*k)+1)))].max))
	($y[n] = {}) unless ($y.has_key?(n))
	$y[n][k] = ans
	ans
end

def a(n)
	return $a[n] if $a.has_key?(n)
	ans = y(n,1)
	$a[n] = ans
	ans
end

puts x(2)
puts x(3)
puts x(4)
puts y(4,4)
puts y(4,3) - (2**60)
puts y(4,2) - (2**60)
puts y(4,1)
puts a(10) - (2**60)
puts a(10**3)
puts
puts a(10**12)

