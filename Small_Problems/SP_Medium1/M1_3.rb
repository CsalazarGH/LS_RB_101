def rotate_array(array)
  array[1..-1] << array[0]
end


def max_rotation(number)

  digits = number.digits.reverse # [] 

  new_array = [] #[3, 2, 1, 5, 7, 9]

  number.to_s.length.times do
    digits = rotate_array(digits) 
    new_array << digits[0]
    digits.shift
  end

  new_array.join.to_i

end



