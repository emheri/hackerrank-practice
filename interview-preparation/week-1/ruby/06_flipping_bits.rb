#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'flippingBits' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts LONG_INTEGER n as parameter.
#

def flippingBits(n)
  mask = (2**32 - 1)
  return n ^ mask
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

q.times do |q_itr|
  n = gets.strip.to_i

  result = flippingBits n

  fptr.write result
  fptr.write "\n"
end

fptr.close()
