# Master makefile for f90wrapTemplate. The actual makefile you want is:
# src/build/Makefile (or src_cs/build/makefile for complex build)

default:
# Check if the config.mk file is in the config dir.
	@if [ ! -f "config/config.mk" ]; then \
	echo "Before compiling, copy an existing config file from the "; \
	echo "config/defaults/ directory to the config/ directory and  "; \
	echo "rename to config.mk. For example:"; \
	echo " ";\
	echo "  cp config/defaults/config.OSX_GFORTRAN.mk config/config.mk"; \
	echo " ";\
	echo "The modify this config file as required. Typically the CGNS directory "; \
	echo "will have to be modified. With the config file specified, rerun "; \
	echo "'make' and the build will start"; \
	else \
	make F90WRAPTEMPLATE || exit 1;\
	make F90WRAPTEMPLATE_CS || exit 1;\
	fi;

F90WRAPTEMPLATE:
# Check if the config.mk file is in the config dir.
	@if [ ! -f "config/config.mk" ]; then \
	echo "Before compiling, copy an existing config file from the "; \
	echo "config/defaults/ directory to the config/ directory and  "; \
	echo "rename to config.mk. For example:"; \
	echo " ";\
	echo "  cp config/defaults/config.OSX_GFORTRAN.mk config/config.mk"; \
	echo " ";\
	echo "The modify this config file as required. Typically the CGNS directory "; \
	echo "will have to be modified. With the config file specified, rerun "; \
	echo "'make' and the build will start"; \
	else \
	(cd src/build/ && make f90wrapTemplate);\
	rm  -f ./python_src/_f90wrapTemplate_pyf90.so;\
	rm -rf ./python_src/f90wrapTemplate_pyf90/;\
	mv ./src/build/_f90wrapTemplate_pyf90* ./python_src/_f90wrapTemplate_pyf90.so;\
	mv ./src/build/f90wrapTemplate_pyf90/ ./python_src/f90wrapTemplate_pyf90/;\
	fi;

F90WRAPTEMPLATE_CS:
# Check if the config.mk file is in the config dir.
	@if [ ! -f "config/config.mk" ]; then \
	echo "Before compiling, copy an existing config file from the "; \
	echo "config/defaults/ directory to the config/ directory and  "; \
	echo "rename to config.mk. For example:"; \
	echo " ";\
	echo "  cp config/defaults/config.OSX_GFORTRAN.mk config/config.mk"; \
	echo " ";\
	echo "The modify this config file as required. Typically the CGNS directory "; \
	echo "will have to be modified. With the config file specified, rerun "; \
	echo "'make' and the build will start"; \
	else \
	(cd src_cs/build/ && make f90wrapTemplate_cs);\
	rm  -f ./python_src/_f90wrapTemplate_pyf90_cs.so;\
	rm -rf ./python_src/f90wrapTemplate_pyf90_cs/;\
	mv ./src_cs/build/_f90wrapTemplate_pyf90_cs* ./python_src/_f90wrapTemplate_pyf90_cs.so;\
	mv ./src_cs/build/f90wrapTemplate_pyf90_cs/ ./python_src/f90wrapTemplate_pyf90_cs/;\
	fi;

clean_build:
	(cd src/build && make clean_build)
	(cd src_cs/build && make clean_build)

clean:
	rm -f -r ./python_src/f90wrapTemplate_pyf90
	rm -f -r ./python_src/f90wrapTemplate_pyf90_cs
	rm -f ./python_src/_f90wrapTemplate_pyf90*
	rm -f ./python_src/_f90wrapTemplate_pyf90_cs*
	rm -f -r ./build/bin
	make clean_build
