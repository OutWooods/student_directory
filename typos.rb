
students = [
  {name: "Dr. Hannibal Lecter", cohort: :may, hobby: :fishing},
  {name: "Darth Vader", cohort: :january , hobby: :knitting},
  {name: "Nurse Ratched", cohort: :november, hobby: :rowing},
  {name: "Michael Corleone", cohort: :january, hobby: :scuba_diving},
  {name: "Alex DeLarge", cohort: :november, hobby: :reading},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: :writing_haikus},
  {name: "Terminator", cohort: :november, hobby: :fishing},
  {name: "Freddy Krueger", cohort: :january, hobby: :trainspotting},
  {name: "The Joker", cohort: :november , hobby: :voluntering},
  {name: "Joffrey Baratheon", cohort: :december, hobby: :painting},
  {name: "Norman Bates", cohort: :april, hobby: :knitting}
]

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


students = input_students
print_header(students)
print_students(students)
print_footer(students)

