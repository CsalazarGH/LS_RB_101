def swap(string)
  strings_swapped = string.split(" ").each do |string|
                    string[0], string[-1] = string[-1], string[0]
                    end
  strings_swapped.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'