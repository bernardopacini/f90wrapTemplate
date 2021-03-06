#==============================================================================
# Configuration file for Ubuntu with gfortran
#==============================================================================
# ----- Define Compiler -------------------------------------------------------
FF90 = gfortran
CC   = cc
FPP  = $(FF90) -E

# ----- Define Precision Flags ------------------------------------------------
# Options for Integer precision flags:
# Options for Real precision flags: -fdefault-real-8
# Default (nothing specified) is 4 byte integers and 8 byte reals
FF90_INTEGER_PRECISION_FLAG =
FF90_REAL_PRECISION_FLAG    = -fdefault-real-8
FF90_PRECISION_FLAGS = $(FF90_INTEGER_PRECISION_FLAG) $(FF90_REAL_PRECISION_FLAG)

# ----- Define Compiler Flags -------------------------------------------------
FF90_FLAGS = -O3 -g -fPIC $(FF90_PRECISION_FLAGS)
CC_FLAGS = -fPIC

# ----- Define Linker Flags ---------------------------------------------------
LINKER       = $(FF90)
LINKER_FLAGS = 

# ----- Python and Fort_Depend Package ----------------------------------------
# Python3 Alias
PYTHON = python3

# Script to generate the dependencies
MAKEDEPEND = fortdepend

# ----- Tapenade --------------------------------------------------------------
tapenade = /path/to/tapenade
