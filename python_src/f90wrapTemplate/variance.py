# Internal Fortran Imports
import f90wrapTemplate_pyf90.mod_variance as f90_variance
import f90wrapTemplate_pyf90.mod_variance_d as f90_variance_d
import f90wrapTemplate_pyf90.mod_variance_b as f90_variance_b

# External Imports
import numpy as np


def variance(a):
    b = np.zeros(1)
    f90_variance.variance(a, b)
    return b


def variance_d(a, ad):
    b = np.zeros(1)
    bd = np.zeros(1)
    f90_variance_d.variance_d(a, ad, b, bd)
    return b, bd


def variance_b(a, bd):
    b = np.zeros(1)
    ad = np.zeros(1)
    f90_variance_b.variance_b(a, ad, b, bd)
    return b, ad
