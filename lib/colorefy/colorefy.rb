require 'pry'
require 'rainbow'  #https://github.com/sickill/rainbow
require 'terminal-table'  #https://github.com/tj/terminal-table
require 'tty-table' #https://github.com/piotrmurach/tty-table

file = 'TEST.txt'
raw_string_array = open(file).to_a

def build_array(str_array)
  new_table = []
  str_array.each do |element|
    processing_string = divide_string(element)
    formatted_array = []
    formatted_array << color_keys(processing_string[0])
    formatted_array << color_description(processing_string[1])
    new_table << formatted_array
  end
  new_table
end

# Depends on text with format of <keys>_(>=2 spaces)_<description>
# Anything after the first 2+ spaces is the description
def divide_string(string)
  string.split(/(  +)/).map(&:strip).select{ |n| !(n.empty?) }
end

def build_table(arrayed_array)
  Terminal::Table.new :rows => arrayed_array
end

def color_keys(string)
  Rainbow(string).blue.bright
end

def color_description(string)
  Rainbow(string).green
end

puts build_table(build_array(raw_string_array))
