def triangle(number)
  space = ' '
  spaces = number - 1
  stars = 1

  loop do 
    puts "#{space * spaces}" + ('*' * stars)
    spaces -= 1
    stars += 1
    break if stars > number
  end

end

triangle(9)
