# Imports
import argparse
import os

# Setup Arguments
parser = argparse.ArgumentParser()
parser.add_argument("--mode", required=True, choices=["forward", "reverse"])
parser.add_argument("--inputDir", required=True)
parser.add_argument("--outputDir", required=True)


def main():
    """
    This is the main function for automatically editing Tapenade generated
    source files. Files are read in, each line is editted as needed, and then
    the updated lines are rewritten.
    """
    # Parse Arguments
    args = parser.parse_args()
    if args.inputDir.endswith("/"):
        inputDir = args.inputDir
    else:
        inputDir = args.inputDir + "/"
    if args.outputDir.endswith("/"):
        outputDir = args.outputDir
    else:
        outputDir = args.outputDir + "/"

    # Read Names of Input Filenames
    fileList = []
    for file in os.listdir(inputDir):
        if file.endswith(".f90"):
            fileList.append(file)

    # Iterate Over Files and Edit as Needed
    for fileName in fileList:
        # Read File
        lines = readFile(inputDir, fileName)

        # Edit Lines
        lines = editFile(lines)

        # Write File
        writeFile(outputDir, fileName, lines)


def readFile(path, fileName):
    """
    This function parses a file and stores the file's lines as a list.

    Parameters
    ----------
    path : string
        Path to directory containing file to be read in

    fileName : string
        The name of the file to be read in

    Returns
    -------
    lines : list of string
        Lines of input code
    """
    # Read File
    try:
        file = open(path + fileName, "r")
        lines = file.readlines()
        file.close()
    except IOError:
        raise IOError(path + fileName + " was not found or could not be imported.")

    return lines


def writeFile(path, fileName, lines):
    """
    This function outputs the rewritten code to the output directory
    given required changes needed to the Tapenade ADed code.

    Parameters
    ----------
    path : string
        Path to file output directory

    fileName : string
        The name of the file to be written out

    lines : list of string
        Lines of editted code to be written out
    """
    file = open(path + fileName, "w")
    file.writelines(lines)
    file.close()


def editFile(linesIn):
    """
    This function carries out the automatic file editing, adjusting lines in
    Tapenade generated code as needed.

    Parameters
    ----------
    linesIn : list of string
        Lines of original source code to be parsed

    Returns
    -------
    linesOut : list of string
        Lines of updated code returned
    """
    iLine = 0
    linesOut = []

    # Fix Lines
    while iLine < len(linesIn):
        linesOut.append(linesIn[iLine])
        iLine += 1

    return linesOut


if __name__ == "__main__":
    main()
