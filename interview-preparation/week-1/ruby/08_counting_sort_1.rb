#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'countingSort' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def countingSort(arr)
  result = Array.new(100, 0)
  
  arr.each do |n|
    result[n] += 1
  end
  
  return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

result = countingSort arr

fptr.write result.join " "
fptr.write "\n"

fptr.close()
