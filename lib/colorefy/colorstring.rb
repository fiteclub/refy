# Simple string colorization courtesy of
# https://stackoverflow.com/a/16363159
# and https://stackoverflow.com/a/11482430/
class String
  def color(escape_code)
    "\e[#{escape_code}m#{self}\e[0m"
  end

  def black; color(30); end
  def red; color(31); end
  def green; color(32); end
  def yellow; color(33); end
  def blue; color(34); end
  def magenta; color(35); end
  def cyan; color(36); end
  def gray; color(37); end
  
  def bg_black; color(40); end
  def bg_red; color(41); end
  def bg_green; color(42); end
  def bg_yellow; color(43); end
  def bg_blue; color(44); end
  def bg_magenta; color(45); end
  def bg_cyan; color(46); end
  def bg_gray; color(47); end
  
  def bold; color(1); end
  def italic; color(3); end
  def underline; color(4); end
  def blink; color(5); end
  def reverse_color; color(7); end
end
