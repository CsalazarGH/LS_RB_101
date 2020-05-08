def rotate_array(array)
  array[1..-1] << array[0]
end



rotate_array([7, 3, 5, 2, 9, 1]) 