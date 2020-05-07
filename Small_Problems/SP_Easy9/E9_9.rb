def get_grade(num1, num2, num3)
  converter = {'A' => (90..100),
               'B' => (80..89),
               'C' => (70..79),
               'D' => (60..69),
               'F' => (0..59) }
               
  avg = [num1, num2,num3].sum / 3

  converter.each do |key, value|
    if value.to_a.include?(avg)
      return key
    end
  end

end




p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"