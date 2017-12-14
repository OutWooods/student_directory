@students = []


def try_load_students
  filename = ARGV.first
  if filename.nil? 
   load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end 

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return"
  name = STDIN.gets.chomp
 
  until name.empty? 
    add_student(name, "November")
    puts "Now we have #{@students.count} students"
    na9me = STDIN.gets.chomp
  end
  @students 
end


def load_students(filename= "students.csv")
   file = File.open(filename, "r")
   file.readlines.each do |student_info|
      name, cohort = student_info.chomp.split(",")
       add_student(name, cohort)
   end
  file.close
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
  puts "4. Load student data from students.csv"
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
     when 4
     load_students 
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
  process(STDIN.gets.chomp.to_i)
 end
end

try_load_students
interactive_menu