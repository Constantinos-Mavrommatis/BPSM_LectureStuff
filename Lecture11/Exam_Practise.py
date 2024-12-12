#!/usr/bin/python3


DNA_sequence = "ACTGATCGATTACGTATAGTATTTGCTATCATACATATATATCGATGCGTTCAT"

print(DNA_sequence)

# Exercise 1

A_count = DNA_sequence.count('A')
T_count = DNA_sequence.count('T')

print("Count of A nucleotides", A_count)

print("Count of T nucleotides", T_count)

Percentage_AT = (A_count + T_count) / len(DNA_sequence)

print("Percentage of AT count in the DNA sequence", Percentage_AT)


# Exercise 2

DNA_sequence = "ACTGATCGATTACGTATAGTATTTGCTATCATACATATATATCGATGCGTTCAT"

print(DNA_sequence)

complemented_dna_sequence = DNA_sequence.replace('A','t').replace('T','a').replace('G','c').replace('C','g')

print(complemented_dna_sequence.upper())

#Exercise 3

DNA_sequence = "ACTGATCGATTACGTATAGTAGAATTCTATCATACATATATATCGATGCGTTCAT"

motif = "GAATTC"

position_motif = DNA_sequence.find(motif)


second_fragment = DNA_sequence[position_motif + 1: ]

print(len(second_fragment))

print(second_fragment)

# Exercise 4

DNA_sequence = "ATCGATCGATCGATCGACTGACTAGTCATAGCTATGCATGTAGCTACTCGATCGATCGATCGATCGATCGATCGATCGATCGATCATGCTATCATCGATCGATATCGATGCATCGACTACTAT"


exon_1 = DNA_sequence[0:63]
exon_2 = DNA_sequence[90: ]

coding_sequence = exon_1 + exon_2

print("This is the coding sequence", coding_sequence)

print("The percentage that of the DNA sequence that is coding is ", (len(coding_sequence) / len(DNA_sequence)) * 100, "%")

# Exercise 4

exon_1 = DNA_sequence[0:63]
exon_2 = DNA_sequence[90: ]
intron = DNA_sequence[63:90].lower()

print(exon_1 + intron + exon_2)


