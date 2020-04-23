def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # points to a new varible
  an_array_param << "rutabaga" # appends to existing variable "my_array"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # my answer before checking: "pumpkins"
puts "My array looks like this now: #{my_array}" # answer before checking: "["pumpkins", "rutabaga"]"