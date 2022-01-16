from distutils.core import setup

# Real Package
# packages = ["f90wrapTemplate", "f90wrapTemplate_pyf90"]

# Real + Complex Package
packages = ["f90wrapTemplate", "f90wrapTemplate_cs", "f90wrapTemplate_pyf90", "f90wrapTemplate_pyf90_cs"]

setup(
    name="f90wrap Template",
    version="1.0.0",
    author="Bernardo Pacini",
    author_email="bpacini@umich.edu",
    description="A template for using f90wrap for a computational aeroscience code.",
    license="MIT",
    package_dir={"": "python_src"},
    packages=packages,
)
