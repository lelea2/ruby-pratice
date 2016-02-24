# Grab 23 random elements between 0 and 10000
arr = (1..10000).to_a.sample(23)
p arr ## print out the array

#eg: => [61, 6969, 9885, 4722, 158, 9979, 4568, 3079, 2590, 2345, 9086, 9611, 1384, 8444, 7815, 5444, 4852, 1317, 1565, 8466, 7220, 5146, 4558]

# This selects only elements that when divided by 3 have a remainder of 0
# using the % (modulus) operator
p arr.select { |element| element % 3 == 0 }

#=> [6969, 9885, 4722, 7815, 1317, 8466]

# Using `reject` method filter out anything less than 5000
# and use `sort` and `reverse` methods to sort in descending order
# Start with the line below and continue as 1 long method chain
p arr.select { |element| element % 3 == 0 }.reject { |element| element < 5000}.sort.reverse
