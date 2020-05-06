def halvsies(array)
  halfway = array.size.odd? ? ((array.size / 2) + 1 ) : (array.size / 2)
  
  first_half = array[0..(halfway-1)]
  second_half = array[halfway..-1]

  [first_half, second_half]
end



p halvsies([1, 2, 3, 4]) 
