def multiply_all_pairs(arr1, arr2)
  products = []

  arr1.each do |num1|
    arr2.each do |num2|
      products << num1 * num2
    end
  end
  products.sort
end


# my other solution

def multiply_all_pairs2(arr1, arr2)
  products = []
  count = 0

  while count < arr1.size
    products << arr2.map do |num|
                  num * arr1[count]
                end
    count += 1
  end

  products.flatten.sort
end
