# Internal Fortran Imports
import f90wrapTemplate_pyf90_cs.mod_math as f90_math

# External Imports
import numpy as np


def divide(a, b):
    c = np.zeros(1)
    f90_math.divide(a, b, c)
    return c


def add(a, b):
    c = np.zeros(1)
    f90_math.add(a, b, c)
    return c


def subtract(a, b):
    c = np.zeros(1)
    f90_math.subtract(a, b, c)
    return c