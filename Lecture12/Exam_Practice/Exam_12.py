#!/usr/bin/python3

import os
import subprocess

subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format fasta | grep -v \">\"  > Remote_sequence.fasta", shell = True)
subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format GenBank | grep  \"CDS\"  > Remote_sequence.gb", shell = True)






with open("plain_genomic_seq.txt") as local_sequence:
    local_sequence_content = local_sequence.read().rstrip().upper()
    
print(local_sequence_content)

# Checking for non-DNA bases

local_anything_left = local_sequence_content.replace("G","").replace("T","").replace("A","").replace("C","")

print(local_anything_left)

# Cleaning the sequence

local_DNA_sequence = local_sequence_content.replace("X","").replace("S","").replace("K","").replace("L","")

print(local_DNA_sequence)

# Getting the local coding and non coding regions

Exon_local_01 = local_DNA_sequence[0:63]

Exon_local_02 = local_DNA_sequence[90:]

Intron_local = local_DNA_sequence[63:90]

# Creating the files for the local intron and exons

with open("intron_local.txt", "w") as intron_txt:
    intron_txt.write(">Intron_region_local_sequence with a length of: " + str(len(Intron_local)) + "\n" )
    intron_txt.write(Intron_local)

with open("exon_local_01.txt", "w") as exon_01_txt:
    exon_01_txt.write(">Exon_region_01_local_sequence with a length of: " + str(len(Exon_local_01)) + "\n")
    exon_01_txt.write(Exon_local_01)


with open("exon_local_02.txt", "w") as exon_02_txt:
    exon_02_txt.write(">Exon_region_02_local_sequence with a length of: " + str(len(Exon_local_02)) + "\n")
    exon_02_txt.write(Exon_local_02)


