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
  column_length = str_array.length/num_columns.to_i
  new_array = []
  puts "num_columns: #{num_columns}, column_length: #{column_length}"
  (0..(column_length - 1)).each do |line|
    column_array = []
    puts "line #{line}"
    (0..(num_columns - 1)).each do |column|
      puts "column #{column}"
      if str_array[column + column_length]
        # puts str_array[line * column]
        column_array << str_array[line + (column * column_length)][0]
        column_array << str_array[line + (column * column_length)][1]
      else
        column_array << ''
        column_array << ''
      end
    end
    new_array << column_array
  end
  new_array
end

keys = build_array(raw_string_array)
max_columns = (IO.console.winsize[1] / (keys.max_by(&:length).join().length + 15)).to_i
colkeys = columnize(keys, max_columns)

binding.pry
puts build_table(colkeys)
puts build_table(build_array(raw_string_array))
