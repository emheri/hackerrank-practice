#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'miniMaxSum' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def miniMaxSum(arr)
  min = max = min_index = 0
  sorted_arr = arr.sort
  max_index = sorted_arr.size - 1
  (1..4).each do
    min = min + sorted_arr[min_index]
    max = max + sorted_arr[max_index]
    min_index += 1
    max_index -= 1
  end
  puts "#{min} #{max}"
end

arr = gets.rstrip.split.map(&:to_i)

miniMaxSum arr
