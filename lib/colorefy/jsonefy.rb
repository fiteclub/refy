#!/usr/bin/ruby
require 'pry'
require 'json'
require_relative 'colorefy'

input_data = File.read('TEST.txt')
delimeter = "  "

def write_to_json(raw_input, delimeter, create_filename)
  input_hash = raw_input.split("\n").map do |line|
    string = line.split("#{delimeter}")
    {keys: string[0], action: string[1]}
  end
  File.open("#{create_filename}", "w") do |f| 
    f.write(JSON.pretty_generate(input_hash))
  end
end

def load_json_to_hash(json_filename)
  JSON.parse(File.read("#{json_filename}"))
end

# def build_array_from_json_hash(json_hash)
#   new_table = []
#   json_hash.each do |element|
#     processing_string = divide_string(element)
#     formatted_array = []
#     formatted_array << color_keys(processing_string[0])
#     formatted_array << color_description(processing_string[1])
#     new_table << formatted_array
#   end
#   new_table
# end

write_to_json(input_data, delimeter, "TEST.json")

data = JSON.parse(File.read('TEST.json'))
binding.pry
puts "end"
