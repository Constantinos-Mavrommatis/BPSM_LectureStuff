#!/usr/bin/python3

#Exercise 4

DNA = "ATCGATCGATCGATCGACTGACTAGTCATAGCTATGCATGTAGCTACTCGATCGATCGATCGATCGATCGATCGATCGATCGATCATGCTATCATCGATCGATATCGATGCATCGACTACTAT"

exon1 = DNA[0:63]

exon2 = DNA[90:]

print("Coding region of the first exon", exon1)

print("Coding region of the second exon", exon2)

coding_sequence = exon1 + exon2

print(coding_sequence)

print(len(coding_sequence))

print(str(int((len(coding_sequence) / len(DNA)) * 100)) )

intron = DNA[64:89]

print(str(exon1.upper()) + str(intron.lower()) + str(exon2.upper()))


