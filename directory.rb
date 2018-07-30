@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  students = []
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      puts ""
      show_students
    when "3"
      save_students
      puts "Student list saved"
    when "4"
      load_students
      puts "Students list loaded"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # first name to enter
  name = STDIN.gets.chomp
  # while the name is not empty, keep repeating the code below
  while !name.empty? do
    # adding the student hash to the students array
    @students << {name: name, cohort: :august}
    puts "#{name} entered, now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_list
  print_footer
end

def print_header
  header = "The Students of Villians Academy"
  puts header
  puts "-------------".center(header.length) #centre the line to 'header' variable
end

def print_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{'s' if (@students.count > 1)}"
  puts ""
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

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} student#{'s' if @students.count > 1} from #{filename}"
    puts ""
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

try_load_students
interactive_menu
