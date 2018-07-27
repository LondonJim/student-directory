def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create the empty array
  students = []
  # first name to enter
  name = gets.chomp
  # while the name is not empty, keep repeating the code below
  while !name.empty? do
    # adding the student hash to the students array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # return the students array
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# call the methods
students = input_students
print_header
print(students)
print_footer(students)
