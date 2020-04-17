advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house')) # Or advice.slice!(0..38)
# => "Few things in life are as important as "
p advice
# => "house training your pet dinosaur."
