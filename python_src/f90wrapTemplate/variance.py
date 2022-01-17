# Internal Fortran Imports
import f90wrapTemplate_pyf90.mod_variance as f90_variance
import f90wrapTemplate_pyf90.mod_variance_d as f90_variance_d
import f90wrapTemplate_pyf90.mod_variance_b as f90_variance_b

# External Imports
import numpy as np


def variance(a):
    b = np.zeros(1)
    f90_variance.variance(a, b)
    return b[0]


def variance_d(a, ad):
    b = np.zeros(1)
    bd = np.zeros(1)
    f90_variance_d.variance_d(a, ad, b, bd)
    return b[0], bd[0]


def variance_b(a, b, bd):
    ad = np.zeros(len(a))
    f90_variance_b.variance_b(a, ad, b, bd)
    return ad
