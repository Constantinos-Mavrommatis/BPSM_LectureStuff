#!/usr/bin/python3

import os
import subprocess
import sys

# Exercise 1

# We are creating a variable with the input file content split into the sequences

input_c = open("input.txt").read().upper().split()

# We are creating a new file that has a loop for each of the split elements without the first 14 base pairs

with open("input_cleaned.txt", "w") as input_clean :
    for sequence in input_c :
        input_clean.write(sequence[14: ] + "\n")
        print(sequence[14: ])

# Exercise 2

exon_positions = open("exons.txt").read().split()

dna_sequence = open("genomic_dna2.txt").read().upper()

with open("exon_dna.txt", "w") as exon_dna :
   for exon in exon_positions :
       start = int(exon.split(',')[0])-1
       stop = int(exon.split(',')[1])
       exon_dna.write(dna_sequence[start:stop])

