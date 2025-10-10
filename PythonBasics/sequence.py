import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

a0 = 5     
d = 2      
N = 10     
sequence = []  
sum = 0 

for i in range(1, N + 1):
    an = a0 + (i - 1) * d
    sequence.append(an)

k0 = 1
kn = 10
terms = [(k**2 - k) for k in range(k0, kn + 1)]

total = 0
for term in terms:
    total += term

sum_loop = sum(terms)

print("Sequence:", sequence)
print("Sum of sequence:", sum)
print("Terms:", terms)
print("Sum using loop:", sum_loop)


# Plot the terms
plt.plot(range(k0, kn + 1), terms, marker='o', linestyle='-', color='blue')
plt.title("Plot of k² - k from k=1 to k=10")
plt.xlabel("k")
plt.ylabel("k² - k")
plt.grid(True)
plt.show()