
students = [
  {name: "Dr. Hannibal Lecter", cohort: :may, hobby: :fishing},
  {name: "Darth Vader", cohort: :january , hobby: :knitting},
  {name: "Nurse Ratched", cohort: :november, hobby: :rowing},
  {name: "Michael Corleone", cohort: :january, hobby: :scuba_diving},
  {name: "Alex DeLarge", cohort: :november, hobby: :reading},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: :writing_haikus},
  {name: "Terminator", cohort: :november, hobby: :fishing},
  {name: "Freddy Krueger", cohort: :january , hobby: :trainspotting},
  {name: "The Joker", cohort: :november , hobby: :voluntering},
  {name: "Joffrey Baratheon", cohort: :december, hobby: :painting},
  {name: "Norman Bates", cohort: :april, hobby: :knitting}
]


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  until name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each{ |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(students)
  puts "We have #{students.count} great students"
end

students = input_students
print_header
print_students(students)
print_footer(students)


=begin 
Former task answers

1) Students with number
   def print_students(students)
  students.each_with_index {|student, index| puts  "#{index+1}. #{student[:name]}  (#{student[:cohort]} cohort)" }
end
2)  Specific letter
   def print_select_students(students)
   first_letter = "A"  
   important_students  = students.select {|student| student[:name][0] == first_letter}
  important_students.each_with_index {|student, index| puts  "#{index+1}. #{student[:name]}  (#{student[:cohort]} cohort)" }
end
3) Studenrt with set name lengths  
def print_select_students(students)
	max_length = 12
   important_students  = students.select {|student| student[:name].length < max_length}
  important_students.each_with_index {|student, index| puts  "#{index+1}. #{student[:name]}  (#{student[:cohort]} cohort)" }
end
4) Until version
def print_students(students)
	counter = 0
	until students[counter] == nil
	  student = students[counter][:name]
      puts  " #{student[:name]}  (#{student[:cohort]} cohort)" 
      counter += 1
     end
end
5) Hobbies
def print_students(students)
	students.each do |student|
      puts  " #{student[:name]}'s hobby is #{student[:hobby]}" 
     end
end
6) Center students
def center_students(students)	
	extra_width = 2
	students.each {|student| information << "#{student[:name]}'s hobby is #{student[:hobby]}"} 
	col_width = information.sort {|a,b| b.length <=> a.length}[0].length + extra_width
    information.each {|student_info| puts student_info.center(col_width)}
end
7) Options for empty answers

def input_students()
  students = []	
   while true
  	student = {}
  	puts "Please put name, hit return to skip, type exit to end"
  	name = gets.chomp 
    student[:name] =  name == "" ?  "Neville" : name 
  	break if student[:name] == "exit" 
  	puts "Please put cohort, hit return to skip, type exit to end"
    cohort = gets.chomp
    student[:cohort] =  cohort == "" ?  :December : cohort.to_sym
    break if cohort  == "exit"
    students << student
	end
	students
end

8) Group by cohort

def print_cohorts(students)
   grouped_by_cohorts = {}
   students.each do |student|
      if grouped_by_cohorts.include?(student[:cohort])
    	grouped_by_cohorts[student[:cohort]] += student[:name] + "\n"
      else 
        grouped_by_cohorts[student[:cohort]] = student[:name] + "\n"
     end
   end
   puts grouped_by_cohorts.flatten
end

9) Plurar/singular checker
option 1: puts "Now we have #{students.count} student#{"s" if students.count > 1}"  (single line but long)
option 2: optional_plural = students.count > 1 ? "s" : ""
          puts "Now we have #{students.count} student#{optional_plural}"

10) Don't use chomp
option 1: name.chop! if name[-1] == "\n"
option 2: name.slice!(-1) if name[-1] == "\n"
=end


