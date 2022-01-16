# Import Configuration File
include ../../config/config.mk

# Set Source Code Directory
SRC = ..

# Set Default Precision (Integer, Double and Real [bytes])
TAPENADE_PRECISION = -i4 -dr8 -r8

# Define Input Files
INPUT_FILES = \
	$(SRC)/math/mod_math.f90\
	$(SRC)/statistics/mod_mean.f90\
	$(SRC)/statistics/mod_variance.f90

INPUT_FILES_NODIR = $(notdir $(INPUT_FILES))

# Define Routines with Dependent and Indepenent Variables
ROUTINES = "\
	mean(a)>(b) \
	variance(a)>(b) \
	"

default: adForward adReverse

adForward:
# Delete Temporary Directory if it Exists
	rm -fr tempForward

# Create the Temporary Directory
	mkdir -p tempForward

# Create Output Directory
	mkdir -p forward

# Run Pre-Processor on All Input Files
	make preProcessForward

# Run Tapenade in Forward Mode
	$(tapenade) \
	-html \
	-head $(ROUTINES) \
	-tangent \
	$(TAPENADE_PRECISION) \
	-tgtfuncname %_d \
	-tgtmodulename %_d \
	-O tempForward \
	$(INPUT_FILES_NODIR)

# Run Python Auto-Edit
	$(PYTHON) autoEdit.py --mode forward --inputDir tempForward/ --outputDir forward/

# Clean Up Tapenade Run
	make cleanPreProcess

adReverse:
# Delete Temporary Directory if it Exists
	rm -fr tempReverse

# Create the Temporary Directory
	mkdir -p tempReverse

# Create Output Directory
	mkdir -p reverse

# Run Pre-Processor on All Input Files
	make preProcessReverse

# Run Tapenade in Forward Mode
	$(tapenade) \
	-html \
	-head $(ROUTINES) \
	-reverse \
	-adjvarname %d \
	-adjfuncname %_b \
	-adjmodulename %_b \
	$(TAPENADE_PRECISION) \
	-O tempReverse \
	$(INPUT_FILES_NODIR)

# Run Python Auto-Edit
	$(PYTHON) autoEdit.py --mode reverse --inputDir tempReverse/ --outputDir reverse/

# Clean Up Tapenade Run
	make cleanPreProcess

preProcessForward:
	@echo "Preprocessing all input files for forward mode AD..."
	@for file in $(INPUT_FILES); do \
		echo Preprocessing $$file; \
		cpp -DUSE_TAPENADE -DTAPENADE_FORWARD -traditional -P $$file $$(basename $$file); \
	done

preProcessReverse:
	@echo "Preprocessing all input files for reverse mode AD..."
	@for file in $(INPUT_FILES); do \
		echo Preprocessing $$file; \
		cpp -DUSE_TAPENADE -DTAPENADE_REVERSE -traditional -P $$file $$(basename $$file); \
	done

cleanPreProcess:
	@for file in $(INPUT_FILES); do \
		rm -f $$(basename $$file); \
	done

clean:
	rm -rf forward reverse tempForward tempReverse
	make cleanPreProcess
