def ascii_value(string)
array_of_vals = string.chars.map do |char| 
                char.ord
                end

value = array_of_vals.sum
end


