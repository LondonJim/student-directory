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
    puts "#{name} entered, now we have #{students.count} students"
    name = gets.chomp
  end
  # return the students array
  students
end

def print_header
  header = "The students of Villians Academy"
  puts header
  puts "-------------".center(header.length) #centre the line to 'header' variable
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student#{'s' if (names.count > 1)}"
  puts ""
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp
    puts ""

    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
