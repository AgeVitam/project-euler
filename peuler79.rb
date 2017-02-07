=begin

A common security method used for online banking is to ask the user for three random 
characters from a passcode. For example, if the passcode was 531278, they may ask for 
the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

The text file, peuler79_keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file so as 
to determine the shortest possible secret passcode of unknown length.

=end

logins = []
File.open("peuler79_keylog.txt","r") do |file|
	file.each_line{|login| logins.push(login.chomp)}
end

chars = logins.join.chars.uniq

#73162890 
#found by just looking at the above array
#two cool solutions at https://projecteuler.net/thread=79;post=425

