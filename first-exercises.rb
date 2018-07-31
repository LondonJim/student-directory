def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create the empty array
  students = []
  # first name to enter
  name = gets.delete("\n").capitalize #alternative to using chomp
  # while the name is not empty, keep repeating the code below
  puts "Please enter student cohort:"
  cohort = gets.chomp.downcase
  if cohort == "" then cohort = "november"; end # default is november
  cohort = cohort.to_sym
  while !name.empty? do
    # adding the student hash to the students array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.delete("\n").capitalize # alternative to using chomp
    puts "Please enter student cohort:"
    cohort = gets.chomp.downcase
    if cohort == "" then cohort = "november"; end # default is november
    cohort = cohort.to_sym
  end
  # return the students array
  students
end

def print_header
  header = "The students of Villians Academy"
  puts header
  puts "-------------".center(header.length) #centre the line to 'header'
end

def print(students)
  pupil = 0
  until students[pupil] == nil # using until instead of each on the array
    puts "#{students[pupil][:name]} (#{students[pupil][:cohort]} cohort)"
    pupil += 1
# replaced 'each' code below with 'until' loop above
#  students.each_with_index do |student, index|
#    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  # adds an 's' to students of name count is larger than 1
  puts "Overall, we have #{names.count} great student#{'s' if (names.count > 1)}"
end

# call the methods
students = input_students
print_header
print(students)
print_footer(students)
