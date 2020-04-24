# Convert a String to a Number!

def string_to_integer(numstring)
  matcher = {'1' => 1,
             '2' => 2,
             '3' => 3,
             '4' => 4,
             '5' => 5, 
             '6' => 6,
             '7' => 7,
             '8' => 8,
             '9' => 9,
             '0' => 0 }
           
  array_of_digits = numstring.chars.map do |char| #[4, 3, 2, 1]
                      matcher[char]
                    end
  value = 0

  array_of_digits.each do |digit|
    value = (10 * value) + digit
  end
  value
end


p string_to_integer('4321')