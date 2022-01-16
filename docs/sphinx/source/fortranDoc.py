__author__ = "Bernardo Pacini"
__email__ = "bpacini@umich.edu"
__date__ = "Sept. 17th, 2021 Fri"

import os
import shutil
import re

# Documentation Root Directory
docPath = "./developer_docs/Fortran/"

# Fortran Source Code Root Directory
src = "../../../src/"

# Fortran Source Code File Extensions
srcExt = ["f90"]

# Directories to Ignore
srcIgnore = ["build", "tempForward", "tempReverse", "ADFirstAidKit"]

# Regular Expressions
# fmt: off
re_program_start = re.compile(r'(?<=(^program\s))(\w+)', re.IGNORECASE)
re_module_start = re.compile(r'(?<=(^module\s)(?!procedure))(\w+)', re.IGNORECASE)
# fmt: on


def generateDoc():
    # If documentation exists, delete it and remake directory
    if os.path.exists(docPath):
        shutil.rmtree(docPath)

    # Traverse source directory
    for root, dirs, files in os.walk(src):
        dirName = os.path.basename(root)

        # Skip over ignored directories
        if dirName in srcIgnore:
            continue

        # Generate documentation only if folder contains Fortran source code
        if any(file.endswith(".f90") for file in os.listdir(root)):
            # Generate new path to documentation folder
            dirRoot = docPath + re.sub(src, "", root)

            # Generate Directory
            os.mkdir(dirRoot)

            # Generate Index File
            fIndex = open(dirRoot + "/" + "index.rst", "w")
            if dirName != "":
                fIndex.write(dirName + "/" + "\n" + "=" * (len(dirName) + 1) + "\n\n")
            else:
                fIndex.write(".. _Fortran_Docs:" + "\n\n" + "Fortran API" + "\n" + "===========" + "\n\n")

            # Write toctree heading
            fIndex.write(".. toctree::\n")
            fIndex.write("    :maxdepth: 2\n\n")

            # Add direct subdirectories that include source code
            for dir in sorted(dirs):
                if any(file.endswith(".f90") for file in os.listdir(root + "/" + dir)) and dir not in srcIgnore:
                    fIndex.write("    " + os.path.basename(dir) + "/" + "index" + "\n")

            # Add Files
            for file in sorted(files):
                if any(file.endswith(ext) for ext in srcExt):
                    # Generate file specific RST file
                    fileName = os.path.splitext(os.path.basename(file))[0]
                    fFile = open(dirRoot + "/" + fileName + ".rst", "w")

                    # Determine module name
                    srcFile = open(root + "/" + file, "r")
                    srcLines = srcFile.readlines()
                    srcFile.close()

                    # Get program / module name
                    found = False
                    for line in srcLines:
                        matchProgram = re_program_start.search(line)
                        matchModule = re_module_start.search(line)

                        if matchProgram is not None:
                            name = matchProgram.group()
                            found = True
                            break

                        elif matchModule is not None:
                            name = matchModule.group()
                            found = True
                            break

                    # If not recognized as program / module, raise error
                    if not found:
                        raise ValueError("Type for " + fileName + "not recognized.")

                    # Write file header and documentation directive
                    fFile.write(name + "\n" + "=" * len(name) + "\n\n")
                    fFile.write(".. f:autosrcfile:: " + fileName + ".f90")

                    # Close file
                    fFile.close()

                    # Add file to directory index file
                    fIndex.write("    " + fileName + "\n")

            fIndex.close()


if __name__ == "__main__":
    generateDoc()
