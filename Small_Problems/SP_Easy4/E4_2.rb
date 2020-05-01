=begin
Problem: Define a method that takes a integer as an argument (a year).  
         The method should return the correct century along with its suffix.
         Example : Century(2000) = 20th century, Century(256) = 3rd century.
Steps: - First calculate the century of the year given
       - Attatch the suffix that would go with that century integer.
       - Return the century with appended suffix
=end

HASH = {0 => 'th',
        1 => 'st',
        2 => 'nd',
        3 => 'rd',
        4 => 'th',
        5 => 'th',
        6 => 'th',
        7 => 'th',
        8 => 'th',
        9 => 'th', }

def add_sufix(century)
  exceptions = [11, 12, 13]
  if exceptions.include?(century % 100)
    'th'
  else
    HASH[century.to_s[-1].to_i]
  end
end

def century(year)
  century = (year / 100) + 1 
  century -= 1 if year % 100 == 0
  string = century.to_s << add_sufix(century)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'