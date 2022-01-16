# Internal Fortran Imports
import f90wrapTemplate_pyf90.mod_mean as f90_mean
import f90wrapTemplate_pyf90.mod_mean_d as f90_mean_d
import f90wrapTemplate_pyf90.mod_mean_b as f90_mean_b

# External Imports
import numpy as np


def mean(a):
    b = np.zeros(1)
    f90_mean.mean(a, b)
    return b


def mean_d(a, ad):
    b = np.zeros(1)
    bd = np.zeros(1)
    f90_mean_d.mean_d(a, ad, b, bd)
    return b, bd


def mean_b(a, bd):
    b = np.zeros(1)
    ad = np.zeros(1)
    f90_mean_b.mean_b(a, ad, b, bd)
    return b, ad
