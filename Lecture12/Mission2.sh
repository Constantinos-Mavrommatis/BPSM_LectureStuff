#!/usr/bin/bash

db="/localdisk/home/s2748062/Exercises/Lecture06/nem" # variable for the database
queryseqs="Coding_sequences.fasta" # variable for the file of all exons

blastx -db ${db} -query ${queryseqs} -outfmt 7 > blast.txt




