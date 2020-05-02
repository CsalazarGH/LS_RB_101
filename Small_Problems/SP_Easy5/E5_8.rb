=begin
1. Create an array with integers 0 to 19
2. Convert each integer into its english word counterpart , EX: 1 to 'One'
3. Sort the english words in alphabetical order and then convert each word back to integer
=end


CONVERTER = { 0 => 'zero',
             1 => 'one',
             2 => 'two',
             3 => 'three',
             4 => 'four',
             5 => 'five',
             6 => 'six',
             7 => 'seven',
             8 => 'eight',
             9 => 'nine',
             10 => 'ten',
             11 => 'eleven',
             12 => 'twelve',
             13 => 'thirteen',
             14 => 'fourteen',
             15 => 'fifteen',
             16 => 'sixteen',
             17 => 'seventeen',
             18 => 'eighteen',
             19 => 'nineteen'}



def alphabetic_number_sort(array)
  sorted_int_words = array.map {|integer| CONVERTER[integer]}.sort
  sorted_integers = sorted_int_words.map {|word| CONVERTER.invert[word]}                  
end

