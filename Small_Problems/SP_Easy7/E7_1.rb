def interleave(arr1, arr2)
  new_arr = []

  (arr1.size).times do
    new_arr << arr1.shift
    new_arr << arr2.shift
  end
  
  new_arr
end



p interleave([1, 2, 3], ['a', 'b', 'c'])
