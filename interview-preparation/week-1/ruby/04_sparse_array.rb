#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'matchingStrings' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. STRING_ARRAY strings
#  2. STRING_ARRAY queries
#

def matchingStrings(strings, queries)
  results = []
  queries.each do |query|
    found = 0
    strings.each do |str|
      found += 1 if str == query
    end
    results << found
  end
  results
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

strings_count = gets.strip.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
  strings_item = gets.chomp

  strings[i] = strings_item
end

queries_count = gets.strip.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
  queries_item = gets.chomp

  queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close()
