def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge2(arr1, arr2)
  arr1 | arr2
end


p merge([1, 3, 5], [3, 6, 9]) 



