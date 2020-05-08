def diamond(int)
  halfway = (int / 2) - 1
  star_count = 1
  space_count = int / 2
 

  loop do
    puts (' ' * space_count) + ('*' * star_count) + (' ' * space_count)
    star_count += 2
    space_count -= 1
    break if star_count > int
  end

  star_count -= 2
  space_count += 1

    loop do
      star_count -= 2
      space_count += 1
      puts (' ' * space_count) + ('*' * star_count) + (' ' * space_count)
      break if star_count == 1
    end
 

end




diamond(3)
=begin
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end