#Programme Logger

#Attempt at the programme logger form Chris Pine
#https://pine.fm/LearnToProgram/chap_10.html exercise 2


def programme_logger (programme,proc)
   puts "#{programme} has started at #{Time.now}"
   proc.call
   puts "#{programme} has finished at #{Time.now}"
end

multiply = Proc.new do 
	        (1..1000).reduce(&:*) 
	       end

one_to_nine_permutations = Proc.new do 
	                       programme_logger("multiply", multiply)
	                       [1,2,3,4,5,6,7,8,9].permutation.to_a
	                       end


programme_logger("Permutations", one_to_nine_permutations)