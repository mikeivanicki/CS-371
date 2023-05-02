# pyex1.py - Standard input in Python 

import sys

for line in sys.stdin:
   # sys.stdout.write( line )
   print(len(line)) # shows hidden newline
   print(len(line.rstrip())) # rstrip acts as "chomp"