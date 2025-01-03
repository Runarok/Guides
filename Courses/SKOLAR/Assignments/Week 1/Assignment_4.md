Virtual Environment Setup.Explain the concept of a virtual environmentin Python. 
Why is it important, especially in data science projects? 
Create a virtual environment named "ml_env" using the venv module (for Python 3.3 and later). 
Activate the virtual environment and install a Python library of your choice (e.g., NumPy) within this environment. 
Write a Python script that imports the library and performs a basic operation (e.g., creating an array or matrix).

A virtual environment in Python is a self-contained directory tree that isolates project-specific Python interpreters, libraries, and dependencies, 
acting as a separate sandbox within the system's main Python installation. 
There are several reasons why it is important in data science projects. 
They include dependency separation, project repeatability, package control as well as tidiness and arrangement. 
Virtual environments assure each project of isolated environments with the exact versions it requires 
so that there are no clashes between different projects or with the python installation on the whole computer. 
They also ensure consistent and replicable environments when shared or reproduced on different machines, ensuring consistent code running across different systems. 
Package management is simplified by virtual environments since users can try out various libraries and versions without fear of unforeseen consequences. 
In addition to this, deploying virtual environments prevents overloading of system’s primary python installation by project specific dependencies leading to neatness and orderliness in work area.

python -m venv ml_env
creates a directory named "ml_env" with the necessary files for your virtual environment.

ml_env\Scripts\activate
The prompt will now change to indicate you're working within the activated virtual environment

pip install numpy
command to install the NumPy library:

import numpy as np
# Create a simple array
array = np.array([1, 2, 3, 4, 5])
# Print the array
print(array)
# Create a matrix (2D array)
matrix = np.array([[1, 2], [3, 4]])
# Print the matrix
print(matrix)

python test_numpy.py
prints the created array and matrix using NumPy within the isolated virtual environment.
