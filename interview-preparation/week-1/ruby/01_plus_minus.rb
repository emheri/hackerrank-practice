#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr)
  positive = 0
  negative = 0
  zero = 0
  size = arr.size
  arr.each do |num|
    positive += 1 if num.positive?
    negative += 1 if num < 0
    zero += 1 if num == 0
  end
  puts sprintf("%0.06f", positive.to_f / size)
  puts sprintf("%0.06f", negative.to_f / size)
  puts sprintf("%0.06f", zero.to_f / size)
end

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

plusMinus arr
