def reverse!(array)
  orig_count = array.size
  count = array.size
  
    loop do
      array << array[count-1]
      count -= 1
      break if count == 0
    end
  
    orig_count.times do 
      array.shift
    end
  
    array
  end