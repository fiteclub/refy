require 'pry'
require 'terminal-table' #https://github.com/tj/terminal-table
# require 'tty-table' #https://github.com/piotrmurach/tty-table
require 'io/console'
require './colorstring'

file = 'TEST.txt'
raw_string_array = File.read(file).split("\n")

def build_content_array(str_array)
  new_table = []
  str_array.each do |element|
    processing_string = divide_string(element)
    formatted_array = [
      processing_string[0].cyan.bold,
      processing_string[1].green
    ]
    new_table << formatted_array
  end
  new_table
end

# Depends on text with format of <keys>_(>=2 spaces)_<description>
# Anything after the first 2+ spaces is the description
def divide_string(string)
  string.split(/(  +)/).map(&:strip).reject(&:empty?)
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
    lengths << string.join.length
  end
  (IO.console.winsize[1] / lengths.max).ceil
end

def build_table(content_array)
  Terminal::Table.new rows: content_array, style: { border: :unicode_round }
end

hotkey_array = build_content_array(raw_string_array)
formatted_hotkey_display_array = columnize(hotkey_array, supportable_columns(hotkey_array))

binding.pry
puts build_table(formatted_hotkey_display_array)
# puts build_table(build_content_array(raw_string_array))
