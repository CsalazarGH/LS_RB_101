# Convert a Number to a String!
def integer_to_string(integer)
   matcher = {1 => '1',
              2 => '2',
              3 => '3',
              4 => '4',
              5 => '5',
              6 => '6',
              7 => '7',
              8 => '8',
              9 => '9',
              0 => '0' }

    string_array =  integer.digits.reverse.map do |digit|
                    matcher[digit]
                    end
    string_array.join
end



p integer_to_string(4321) 
p integer_to_string(0) 
p integer_to_string(5000) 