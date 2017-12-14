
@students = []
@student_file =  "students.csv"


# Option 1
def input_students
  puts "Please enter a student name", "To finish, just hit return"
  name = STDIN.gets.chomp
  return  puts "Finished inputting"  if name.empty?
  add_student(name, "November")
  puts "Now we have #{@students.count} students"
  input_students
end


#Option 2
def show_students
  return puts "There are no students registered at Makers" if @students.empty? 
   puts "The students of my cohort at Makers Academy", "-------------"
   @students.each{|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
   puts "Overall, we have #{@students.count} great students"
end

#Loading and Saving
def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end 

def file_exists(filename)
 if (filename.nil? || filename.empty?)
    puts  "Using default: #{@student_file}"
    return @student_file
  elsif File.exists?(filename)
    puts  "#{filename} successful"
    return filename
   else 
    puts  "Sorry #{filename} does not exist, have another go"
    choose_file
    end
end

def choose_file
   puts "Please select a file use"
   puts "Press return to use default: #{@student_file}"
   puts "Press 9 to exit programme"
   file = STDIN.gets.chomp
   exit if file == "9"
   return file_exists(file)
end

def load_students(filename= @student_file)
   student_file = File.open(filename, "r")
   student_file.readlines.each do |student_info|
      name, cohort = student_info.chomp.split(",")    #could also save as an array, then make add_student take an array as an input but not sure this is beter/clearer
      add_student(name, cohort)
   end
  student_file.close
  puts "Successfully loaded #{@students.count} from #{filename}"
end


def save_students(filename= @student_file)
  file = File.open(filename, "w")
  @students.each {|student|  file.puts "#{student[:name]}, #{student[:cohort]}" }
  file.close
  puts "Successfully saved students to #{filename}"
end


#Menu Options

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student data to #{@student_file}"
  puts "4. Load student data from #{@student_file}"
  puts "9. Exit"
end

def process(selection)
    case selection
     when 1 
      input_students
     when 2 
      show_students
     when 3 
      file = choose_file
      save_students(file) 
     when 4 
      file = choose_file
      load_students(file) 
     when 9
      puts "Exiting programme..." 
      exit
     else 
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  print_menu
  process(STDIN.gets.chomp.to_i)
  puts
  interactive_menu    
end

#Run on load
load_file = file_exists(ARGV.first)  
@student_file = load_file
load_students(@student_file)
interactive_menu