def rotate_array(array)
  array[1..-1] << array[0]
end


def rotate_rightmost_digits(number, count)
  rotate_these = number.digits.reverse[-count..-1]
  keep_these = number.digits.reverse - rotate_these
  (keep_these + rotate_array(rotate_these)).join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917