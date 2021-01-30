require 'pry'
require 'rainbow'  #https://github.com/sickill/rainbow
require 'terminal-table'  #https://github.com/tj/terminal-table
require 'tty-table' #https://github.com/piotrmurach/tty-table
require 'io/console'

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

# Hash does not work for display array
def build_hash(str_array)
  str_array.split("\n").map do |line|
    line_array = divide_string(line)
    {keys: line_array[0], action: line_array[1]}
  end
end

def colorize_hash(keys_action_hash)
  keys_action_hash.map do |element|
    { keys: color_keys(element[:keys]), action: color_description(element[:action]) }
  end
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

def columnize(str_array, num_columns)
  str_array = make_even_columns(str_array, num_columns)
  column_length = (str_array.length.to_f/num_columns)
  new_array = []
  if num_columns > 1
    (0..(column_length - 1)).each do |line|
      column_array = []
      (0..(num_columns - 1)).each do |column|
        column_array << str_array[line + (column * column_length)][0]
        column_array << str_array[line + (column * column_length)][1]
      end
      new_array << column_array
    end
  else
    new_array = str_array
  end
  new_array
end

# Yes it's a while loop. Behold my skill.
def make_even_columns(array, num_columns)
  while array.length%num_columns != 0
    array << array[0].map { |item| "" }
  end
  array
end

def supportable_columns(str_array)
  lengths = []
  str_array.each do |string|
    lengths << string.join().length
  end
  (IO.console.winsize[1] / lengths.max).ceil
end

keys = build_array(raw_string_array)
colkeys = columnize(keys, supportable_columns(keys))

binding.pry
puts build_table(colkeys)
puts build_table(build_array(raw_string_array))
