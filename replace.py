#!/usr/bin/env python
import fileinput
import sys

"""
To use, run program from the command line like this:
script.py path/to/fileToSearch textToSearch textToReplace
"""

fileToSearch = sys.argv[1]
textToSearch = sys.argv[2]
textToReplace = sys.argv[3]

file_to_edit = fileinput.FileInput(fileToSearch, inplace=True, backup='.bak')
for line in file_to_edit:
    print line.replace(textToSearch, textToReplace).strip()
file_to_edit.close()
