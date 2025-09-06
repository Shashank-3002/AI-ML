import numpy as np
import matplotlib.pyplot as plt 

def lin_eq(a, b, x):
    return a * x + b

def quad_eq(a, b, c, x):
    return a * x**2 + b * x + c

x = np.linspace(-10, 10, 200)  

a_lin, b_lin = 2, 2
a_quad, b_quad, c_quad = 1, -3, 2

y_lin = lin_eq(a_lin, b_lin, x)
y_quad = quad_eq(a_quad, b_quad, c_quad, x)

plt.figure(figsize=(8, 6))
plt.plot(x, y_lin, label='Linear: y = 2x + 2', color='blue')
plt.plot(x, y_quad, label='Quadratic: y = x² - 3x + 2', color='red')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.legend()
plt.show()

