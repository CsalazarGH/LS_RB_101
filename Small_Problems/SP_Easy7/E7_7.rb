def multiply_list(arr1, arr2)
  count = 0
  new_array = []

  loop do 
    new_array << arr1[count] * arr2[count]
    count += 1
    break if count == arr1.size
  end

  new_array
end



p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
