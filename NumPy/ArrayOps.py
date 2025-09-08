import numpy as np
# a+b operation in Lists represents the joining of the two lists
a = [1,2,3,4]
b= [5,6,7,8]
print(a+b)

# Create a NumPy array
array = np.array([1, 2, 3, 4, 5, 'a','b'])
print("Original array:", array,"\n")

#type of array and its elements
print(type(array),"\n")
print(type(array[2]),"\n")#displays the type of the array element
print(type(array[5]),"\n")

# Perform element-wise addition
added_array = array + '5'
print("Array after adding 5:", added_array)
print(type(added_array),"\n")
print(type(added_array[2]),"\n")


#Array with all zeros
array_zeros = np.zeros(4)
print(array_zeros,"\n")

#Array with all ones
array_ones = np.ones(4)
print(array_ones,"\n")

# create an empty array of length 4 which is not empty but have some random numbers
empty_array = np.empty(4)
print(empty_array,"\n") 


#Array with n elements starting from 0 to n-1
array1 = np.arange(10)
print(array1,"\n")

#Finding the square root of the elements and applying diff functions on it
print(np.sqrt(array1))
print(np.round(np.sqrt(array1)))
print(np.float64(np.sqrt(array1)))
print(np.ceil(np.sqrt(array1)))

#Array starting from which no. we want and till what no. with what gap betweem each 
array2 = np.arange(1,9,1.5)
print(array2,"\n")
#Max and min element in the array
print(np.max(array2))
print(np.min(array2))
#To display the index of the max and min element
print(np.argmax(array2))
print(np.argmin(array2))

# generate an array of 5 random numbers
array3 = np.random.rand(5)
print("Array of random 5 numbers: ", array3,"\n")
#Max and min element in the array
print(np.max(array3))
print(np.min(array3))
#To display the index of the max and min element
print(np.argmax(array3))
print(np.argmin(array3))
print(set(array3))

# generate a random element within 10 
array4 = np.random.randint(10)
print("Random number within 10 : ",array4,"\n") #Displays a random number within 10, every time you run it displays a different number

#Generation of random 2D array using NumPy and random function
array5 = np.random.randn(3,4) #4 column and 3 row array is created
print("Random 3x4 array:\n",array5,"\n")

#Reshaping this array
print("Reshaping the random array:\n",array5.reshape(2,6),"\n")

#Mean of all the elements in this array can be calculated using the function
#Axis = 0 represents the mean as a row while axis=1 represents as a column
print("Mean of all the elements in the array 5 as a Row: ",np.mean(array5,axis=0),"\n") #This changes for every run as the random generation also changes 
print("Mean of all the elements in the array 5 as a column: ",np.mean(array5,axis=1),"\n") #This changes for every run as the random generation also changes 




