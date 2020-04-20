# Palindromic Numbers

def palindromic_number?(digit)
  digit.to_s.reverse == digit.to_s
end