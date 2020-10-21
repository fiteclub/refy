#!/usr/bin/env ruby
require 'yaml'

def print_ref (name)
  file = "txt/#{name}.txt"
  ref_data = open file

  ref_data.each do |line|
    print line
  end

  ref_data.close
end

print_ref(ARGV[0])
