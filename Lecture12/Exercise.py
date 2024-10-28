#!/usr/bin/python3

import os
import shutil
import subprocess

#We are copying the local sequence to our location

shutil.copy("/localdisk/data/BPSM/Lecture12/plain_genomic_seq.txt", "./")

#We are getting remotely a fasta and Genbank file of the AJ223353 sequence 

subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format fasta | grep -v \">\" >  AJ223353_fasta.fasta", shell=True)

subprocess.call("esearch -db nucleotide -query \"AJ223353\" | efetch -format gb > AJ223353.nuc.gb", shell=True)

#Here we are manipulating the sequence of the local fasta file we obtained so its on one line and also removing all the non DNA characters while we are getting exon,intron variables of the sequence and then outputing them on a txt file

with open("plain_genomic_seq.txt") as local_sequence:
    local_sequence_contents = local_sequence.read()
    local_sequence_ready = local_sequence_contents.replace("\n","").replace("X","").replace("t","").replace("S","").replace("K","").replace("L","")

local_exon1 = local_sequence_ready[:63]
local_exon2 = local_sequence_ready[90:]
local_intron = local_sequence_ready[63:90]

with open("Local_sequence_exon_01.fasta", "w") as exon1_file:
    exon1_file.write(">Local_sequence_exon_01_length" + str(len(local_exon1)))
    exon1_file.write("\n" + str(local_exon1))

with open("Local_sequence_exon_02.fasta", "w") as exon2_file:
    exon2_file.write(">Local_sequence_exon_02_length" + str(len(local_exon2)))
    exon2_file.write("\n" + str(local_exon2))

with open("Local_sequence_intron_01.fasta", "w") as intron_file:
    intron_file.write(">Local_sequence_intron_01_length" + str(len(local_intron)))
    intron_file.write("\n" + str(local_intron))


#Here we are manipulating the sequence of the remote fast file we obtained so it's on one line, we are getting the intron, exon locations and outputting them on a file 


with open("AJ223353_fasta.fasta") as remote_sequence:
    remote_sequence_contents = remote_sequence.read()
    remote_sequence_ready = remote_sequence_contents.replace("\n","")

remote_coding = remote_sequence_ready[28:409]
remote_non_coding1 = remote_sequence_ready[:28] 
remote_non_coding2 = remote_sequence_ready[409:]

 
with open("Remote_sequence_coding.fasta", "w") as coding_file:
    coding_file.write(">Remote_sequence_coding_length" + str(len(remote_coding)))
    coding_file.write("\n" + str(remote_coding))

with open("Remote_sequence_non_coding_01.fasta", "w") as non_coding1_file:
    non_coding1_file.write(">Remote_sequence_non_coding_01_length" + str(len(remote_non_coding1)))
    non_coding1_file.write("\n" + str(remote_non_coding1))

with open("Remote_sequence_non_coding_02.fasta", "w") as non_coding2_file:
    non_coding2_file.write(">Remote_sequence_non_coding_02_length" + str(len(remote_non_coding2)))
    non_coding2_file.write("\n" + str(remote_non_coding2))


