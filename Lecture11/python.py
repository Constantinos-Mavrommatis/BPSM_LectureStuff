#!/usr/bin/python3



DNA_Sequence = "ACTGATCGATTACGTATAGTATTTGCTATCATACATATATATCGATGCGTTCAT"

print(DNA_Sequence)


#Exercice 1

Adenine_count = DNA_Sequence.count('A')

Thymine_count = DNA_Sequence.count('T')

print("Adenine: % " + str(Adenine_count / len(DNA_Sequence)))

print("Thymine: % " + str(Thymine_count / len(DNA_Sequence)))

#Exercise 2

Comp_DNA = DNA_Sequence.replace("A","t")

Comp_DNA = Comp_DNA.replace("T","a")

Comp_DNA = Comp_DNA.replace("C","g")

Comp_DNA = Comp_DNA.replace("G","c")

Comp_DNA = Comp_DNA.upper()

print(DNA_Sequence)

print(Comp_DNA)

#Exercise 3

DNA = "ACTGATCGATTACGTATAGTAGAATTCTATCATACATATATATCGATGCGTTCAT"

motif_position = DNA.find("AATTC")

DNA_cut = DNA[22:]

DNA_cut_length = len(DNA_cut)

print("The length of the second fragment based on the cut position is ", DNA_cut_length)

