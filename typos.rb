

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
 
  until name.empty? 
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students 
end

def print_header(students)
  return false if students.empty? 
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students(students)
 return false if students.empty? 
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end


def interactive_menu
students = []
loop do 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  selection = gets.chomp.to_i
  case selection 
  when 1
    students = input_students
  when 2
    print_header
    print_students
    print_footer
  when 9
     exit 
  else 
    puts "I don't know what you meant, try again"
  end
 end
end

interactive_menu