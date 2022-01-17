# Internal Fortran Imports
import f90wrapTemplate_pyf90_cs.mod_variance as f90_variance

# External Imports
import numpy as np


def variance(a):
    b = np.zeros(1, dtype=complex)
    f90_variance.variance(a, b)
    return b[0]
