def print_in_box(string)
  horizontal_lines = '-' * (string.length + 2)
  horizontal_spaces = ' ' * (string.length + 2)

  puts "+#{horizontal_lines}+"
  puts "|#{horizontal_spaces}|"
  puts "| #{string} |"
  puts "|#{horizontal_spaces}|"
  puts "+#{horizontal_lines}+"
end
