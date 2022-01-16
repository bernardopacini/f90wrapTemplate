# Internal Fortran Imports
import f90wrapTemplate_pyf90_cs.mod_mean as f90_mean

# External Imports
import numpy as np


def mean(a):
    b = np.zeros(1)
    f90_mean.mean(a, b)
    return b
