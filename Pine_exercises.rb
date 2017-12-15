#Programme Logger

#Attempt at the programme logger form Chris Pine
#https://pine.fm/LearnToProgram/chap_10.html exercise 2

@padding = ""

def programme_logger (programme,proc)
   padding_length = 2
   puts "#{@padding}#{programme} has started at #{Time.now}"
   @padding += " " * padding_length
   proc.call
   @padding.slice!(0,padding_length)
   puts "#{@padding}#{programme} has finished at #{Time.now}"
 
end

add_to_1000 = Proc.new do 
	     (1..1000).reduce(&:+)
	   end

multiply_to_1000 = Proc.new do 
	       programme_logger("add_to_1000", add_to_1000)
	       (1..1000).reduce(&:*) 
	       end

one_to_nine_permutations = Proc.new do 
	                       programme_logger("multiply_to_1000", multiply_to_1000)
	                       [1,2,3,4,5,6,7,8,9].permutation.to_a
	                       end


programme_logger("Permutations", one_to_nine_permutations)