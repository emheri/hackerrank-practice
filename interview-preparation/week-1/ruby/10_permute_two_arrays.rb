#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'twoArrays' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY A
#  3. INTEGER_ARRAY B
#

def twoArrays(k, a, b)
  a.sort!                     # Sort A in non-decreasing order
  b.sort! { |x, y| y <=> x }  # Sort B in non-increasing order
  
  a.each_with_index do |_, i|
    if a[i] + b[i] < k
      return "NO"
    end
  end

  return "YES"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

q.times do |q_itr|
    first_multiple_input = gets.rstrip.split

    n = first_multiple_input[0].to_i

    k = first_multiple_input[1].to_i

    a = gets.rstrip.split.map(&:to_i)

    b = gets.rstrip.split.map(&:to_i)

    result = twoArrays k, a, b

    fptr.write result
    fptr.write "\n"
end

fptr.close()
