#!/usr/bin/python3

import os
import shutil
import subprocess


shutil.copy("/localdisk/data/BPSM/Lecture12/plain_genomic_seq.txt", "./")

subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format fasta | grep -v \">\" >  AJ223353_fasta.fasta", shell=True)

with open("plain_genomic_seq.txt") as local_sequence:
    local_sequence_contents = local_sequence.read()
    local_sequence_ready = local_sequence_contents.replace("\n","").replace("X","").replace("t","").replace("S","").replace("K","").replace("L","")
    print(local_sequence_ready)

with open("AJ223353_fasta.fasta") as remote_sequence:
    remote_sequence_contents = remote_sequence.read()
    remote_sequence_ready = remote_sequence_contents.replace("\n","")
    print(remote_sequence_ready)

subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format gb > AJ223353.nuc.gb", shell=True) 






