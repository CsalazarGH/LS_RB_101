def my_method(array)
  if array.empty?
    []
  elsif array.size > 1 # This is where the error was. Fixed by evaluating the array size
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])