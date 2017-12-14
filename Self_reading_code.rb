#Programme starts here

def scrabble_score() 
   dictionary = {
      10 => ["q", "z"],
       8 => ["j", "x"], 
       5 => ["k"],  
       4 => ["f", "h", "v", "w", "y"], 
       3 => ["b", "c", "m", "p"],
       2 => ["d", "g"], 
       0 => [" "], 
       1 => ["e", "a", "i", "o", "n", "r", "t", "l", "s", "u"]
  }

   puts "Give me a word"
   word = gets.chomp.downcase().split("")
  
   score = 0
  
      word.each do |letter| 
   	      dictionary.each{|key, value| score += key if value.include?(letter)}
   	  end

   puts score
end 

scrabble_score()

def reads_programme
	File.open("Self_reading_code.rb", "r") do |file|
		file.readlines.each do |line| 	puts line  end
		puts "All done"
	   end
end	   

reads_programme

#Programme Ends here