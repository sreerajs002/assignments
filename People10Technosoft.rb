def get_longest_substring_length
	while(true)
		puts "Enter a string 's'"
		s = gets.strip
		puts "Enter a string 't'"
		t = gets.strip
		substrings = []
		i = 0
		while i < s.length
			j  = 0 
			while j < t.length
				substring = []
				# finding first char match
				if s[i] == t[j]
					substring << s[i]
					# continuing comparing till no match 
					index = 1
					while( ((index + i ) < s.length) && ((index + j) < t.length))
						if s[i + index] == t[j + index]
							substring << s[ i + index]
						else
							break
						end
						index +=1
					end
				end
				j += 1
				# pushing length oh the matched substring				
				substrings << substring.length
			end
			i += 1
		end
		puts "\nThe length of the longest commong substring is #{substrings.max}"
		puts "\nPress any key to test another case. Enter 'q' to exit"
		if gets.strip == 'q'
			break
		end
	end
end

def palindrome? string
	string = string.split('').reject {|char| !(('a' .. 'z').include? char)}
	string == string.reverse
end

def numerical? string
	string.to_i.to_s == string
end

def obtain_cipher_value
	# converting given ciper value to hash
	cipher_values = ('a'..'z').each_with_index.map{|a,i|[a,i+1]}.to_h 
	while(true)
		puts "Enter a string 't'"
		t = gets.strip.downcase
		puts "\nResult:\n"
		if numerical? t
			puts ''
		elsif palindrome? t
			puts "palindrome"
		else
			puts t.split('').map{|char| cipher_values[char]}.inject(:*)
		end
		puts "\nPress any key to test another case. Enter 'q' to exit"
		if gets.strip == 'q'
			break
		end
	end
end

# creating loop to test repeatedly.
while(true)
	puts "\nSelect the problem to test by entering its associated serial number...!"
	puts "\n1. Longest Common Substring Problem\n2. Obtain Julius Cipher Value Problem\n3. Exit\n"
	choice = gets.strip
	case choice
	when '1'
		get_longest_substring_length
	when '2'
		obtain_cipher_value
	when '3'
		break
	else
		puts "invalid choice..! try again..!\n"

	end
end