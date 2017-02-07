=begin
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
=end

characters = IO.readlines('peuler59_cipher.txt').to_s.split(',')
characters[0] = 79
characters[-1] = 73
characters.collect! {|n| n.to_i}

cleartext = Array.new(characters.length)


(97..122).each {|a|	#a to z
	(97..122).each {|b|
		(97..122).each {|c|
			i = 0
			(0...(characters.length)).each {|n|
				cleartext[n] = characters[n] ^ a if i == 0
				cleartext[n] = characters[n] ^ b if i == 1
				cleartext[n] = characters[n] ^ c if i == 2
				#32 == space. Text also includes punctuation!
				break if (cleartext[n] < 32) or (cleartext[n] > 122)
				i = (i + 1) % 3
				if n == (characters.length - 1)
					puts "password:"
					puts a.chr + b.chr + c.chr
					puts "yields:"
					puts cleartext.collect{|h|h.chr}.join
					puts "which sums to #{cleartext.reduce(:+)}"
				end
			}
		}
	}
}
