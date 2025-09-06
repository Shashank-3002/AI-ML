import numpy as np
# a+b operation in Lists represents the joining of the two lists
a = [1,2,3,4]
b= [5,6,7,8]
print(a+b)

# Create a NumPy array
array = np.array([1, 2, 3, 4, 5, 'a','b'])
print("Original array:", array)

#type of array and its elements
print(type(array))
print(type(array[2]))#displays the type of the array element
print(type(array[5]))

# Perform element-wise addition
added_array = array + '5'
print("Array after adding 5:", added_array)
print(type(added_array))
print(type(added_array[2]))


#Array with all zeros
array_zeros = np.zeros(4)
print(array_zeros)

#Array with all ones
array_ones = np.ones(4)
print(array_ones)

#Array with n elements starting from 0 to n-1
array1 = np.arange(10)
print(array1)

#Array starting from which no. we want and till what no. with what gap betweem each 
array2 = np.arange(1,9,1.5)
print(array2)

# generate an array of 5 random numbers
array3 = np.random.rand(5)
print(array3)

# generate a random element within 10 
array3 = np.random.randint(10)
print(array3)

# create an empty array of length 4 which is not empty but have some random numbers
empty_array = np.empty(4)

print(empty_array)

