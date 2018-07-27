# students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# print students
puts "THe students of Villians Academy"
puts "-------------"
students.each do |student|
  puts student
end
# print the total number of students
puts "Overall, we have #{students.count} great students"
