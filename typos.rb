@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  name = gets.chomp
 
  until name.empty? 
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students 
end

def print_header
  return false if @students.empty? 
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
 return false if @students.empty? 
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  print "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student data to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
  puts
end

def process(selection)
   case selection
     when 1
     input_students
     when 2
     show_students
     when 3
     save_students 
     when 9
     exit
     else
     puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end

  file.close
end

def interactive_menu
loop do 
  print_menu
  selection = gets.chomp.to_i
  process(selection)
 end
end

interactive_menu