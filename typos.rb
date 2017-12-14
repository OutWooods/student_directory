@students = []
@student_file = "students.csv"

def try_load_students
  filename = ARGV.first
  if filename.nil? 
    puts load_students
  elsif File.exists?(filename)
    puts load_students(filename)
  else 
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end


def load_students(filename= @student_file)
   student_file = File.open(filename, "r")
   student_file.readlines.each do |student_info|
      name, cohort = student_info.chomp.split(",")    #could also save as an array, then make add_student take an array as an input
      add_student(name, cohort)
   end
  student_file.close
  puts "Successfully loaded #{@students.count} from #{filename}"
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end 

def input_students
  puts "Please enter the names of the students", "To finish, just hit return"
  name = STDIN.gets.chomp

  until name.empty? 
    add_student(name, "November")
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  puts "Finish inputting"
end


def print_header
  puts "The students of my cohort at Makers Academy", "-------------"
end

def print_student_list
  @students.each{|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
  print "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student data to #{@student_file}"
  puts "4. Load student data from #{@student_file}"
 
  puts "9. Exit"
end

def show_students
  return puts "There are no students registered at Makers" if @students.empty? 
  print_header
  print_student_list
  print_footer
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
      puts "Exiting programme..." 
      exit
     else 
      puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open(@student_file, "w")
  @students.each {|student|  file.puts "#{student[:name]}, #{student[:cohort]}" }
  file.close
  puts "Successfully saved students to #{@student_file}"
end


def interactive_menu
  print_menu
  process(STDIN.gets.chomp.to_i)
  puts
  interactive_menu    #made the code just recursive, as it shortened it and the loop seemed unnessary
end

try_load_students
interactive_menu