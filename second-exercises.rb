require 'csv'

@students = []

def try_load_students
  @filename = ARGV.first
  loading_file
end

def print_menu
  puts "***Current work file: #{@filename}***"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Reload the list (removing any current changes)"
  puts "5. Change work file"
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
      puts ""
    when "4"
      load_students
      puts "Students list loaded"
      puts ""
    when "5"
      work_file
    when "9"
      exit
    else
      puts "Please enter one of the numbered options"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    add_students_array(name, "august")
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
  CSV.open("./#{@filename}", "wb") do |csv| #using CSV Class to save
    @students.each do |student|
      student_data = [student[:name], student[:cohort].to_s]
      print student_data
      csv << student_data
    end
  end
end

def load_students
  @students = [] # reset array ready for file data
  CSV.foreach("./#{@filename}") do |line| # Use the CSV Class to load line by line
    name = line[0]; cohort = line[1]
    @students << { name: name, cohort: cohort.to_sym }
  end
end

def loading_file
  @filename = "students.csv" if @filename.nil? # defaults to 'students.csv' if no arguement given
  if File.exists?(@filename)
    load_students
    puts "Loaded #{@students.count} student#{'s' if (@students.count > 1)} from #{@filename}"
    puts ""
  else
    puts "Sorry, #{@filename} does not exist, loading students.csv as default"
    puts ""
    @filename = "students.csv"
  end
end

def add_students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def work_file
  puts "Do you wish to save current list before changing work file?(Y/N)"
  answer = gets.chomp
  if answer == "Y"
    print "Student list saved\n"
    save_students
  elsif answer != "N"
    print "Please enter Y or N, returning to main menu\n\n"
    return
  end
  puts "Please enter file name"
  @filename = gets.chomp
  loading_file
end

try_load_students
interactive_menu
