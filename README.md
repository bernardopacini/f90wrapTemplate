f90wrap Template
================

This repository contains a template for code based in Fortran and wrapped in Python.
The wrapping is handled by [f90wrap](https://github.com/jameskermode/f90wrap), an extension of [Numpy's f2py](https://numpy.org/doc/stable/f2py/) tool.
This skeleton also includes the necessary files for documentation in both Sphinx and Doxygen.

Directory Structure
-------------------

The structure of the repository is to follow the MDO Lab structure needed for computational codes.

Python - Fortran Wrapping
-------------------------

Dependencies
------------

Code:

* Python3
* numpy
* f90wrap
* fortdepend
* GCC (gfortran / gcc)

Documentation:

* Doxygen
* Sphinx
* sphinx-prompt
* autoapi
* sphinxcontrib-bibtex
* sphinx-fortran

Testing
-------

* testflo

License
-------

Copyright (c) 2022 Bernardo Pacini - This repository is licensed with a MIT license and is available as opensource. More information about the license is included within the `LICENSE` file.
