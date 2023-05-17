#!/bin/ruby

require 'json'
require 'stringio'
require 'set'

#
# Complete the 'pangrams' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def pangrams(s)
  # Write your code here
  # Convert the string to lowercase for case-insensitive comparison
  s = s.downcase

  # Create a set to keep track of the presence of each letter
  letter_set = Set.new

  # Iterate over each character in the string
  s.each_char do |ch|
    # Check if the character is a letter
    if ch.match?(/[a-z]/)
      # Add the letter to the set
      letter_set.add(ch)
    end
  end

  # Check if all letters from 'a' to 'z' are present
  ('a'..'z').each do |ch|
    return 'not pangram' unless letter_set.include?(ch)
  end

  'pangram'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = pangrams s

fptr.write result
fptr.write "\n"

fptr.close()
#!/bin/ruby

require 'json'
require 'stringio'
require 'set'

#
# Complete the 'pangrams' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def pangrams(s)
  # Convert the string to lowercase for case-insensitive comparison
  s = s.downcase

  # Create a set to keep track of the presence of each letter
  letter_set = Set.new

  # Iterate over each character in the string
  s.each_char do |ch|
    # Check if the character is a letter
    if ch.match?(/[a-z]/)
      # Add the letter to the set
      letter_set.add(ch)
    end
  end

  # Check if all letters from 'a' to 'z' are present
  ('a'..'z').each do |ch|
    return 'not pangram' unless letter_set.include?(ch)
  end

  'pangram'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = pangrams s

fptr.write result
fptr.write "\n"

fptr.close()
