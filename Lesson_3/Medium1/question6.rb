answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# => 34
# answer - 8 = 34 because answer is not mutated by mess_with_it
