# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# this takes the index of the element you wish to delete.

numbers.delete(1)
# this takes the value of the element you wish to delete
