#Programme Logger

#Attempt at the programme logger form Chris Pine
#https://pine.fm/LearnToProgram/chap_10.html exercise 2


def programme_logger (programme,proc)
   puts "#{programme} has started at #{Time.now}"
   proc.call
   puts "#{programme} has finished at #{Time.now}"
end


One_to_nine_permutations = Proc.new {[1,2,3,4,5,6,7,8,9,10].permutation.to_a}


programme_logger("Permutations", One_to_nine_permutations)