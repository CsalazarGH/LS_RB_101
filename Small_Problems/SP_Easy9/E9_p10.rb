def buy_fruit(array)
  array.map do |set|
    ((set[0] + ' ') * set[1]).split(' ')
  end.flatten
end


#solution 2

def buy_fruit2(array)
  array2 = []

  array.each do |set|
    set[1].times do 
      array2 << set[0]
    end
  end
 array2
end


