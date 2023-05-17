#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
  hour, minute, second_am_pm = s.split(":")
  am_pm = second_am_pm[-2, 2].upcase

  if am_pm == "PM" && hour != "12"
    hour = (hour.to_i + 12).to_s
  elsif am_pm == "AM" && hour == "12"
    hour = "00"
  end

  "#{hour}:#{minute}:#{second_am_pm[0, 2]}"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = timeConversion s

fptr.write result
fptr.write "\n"

fptr.close()
