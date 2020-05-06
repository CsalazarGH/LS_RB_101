def include?(array, num)
  array.keep_if do |ele|
    ele == num
  end

array.empty? ? false : true
end

p include?([1,2,3,4,5], 6) == false
p include?([1,2,3,4,5], 3) == true
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
