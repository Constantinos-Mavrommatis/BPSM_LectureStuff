#!/usr/bin/python3

input = open("xaa.dna").read().upper().split()

start = list(range(100,1000,100))

for number in start :
    with open(f"xaa_{number}_long_sequences.txt", "a") as new :
        for sequence in input :
            if number <= len(sequence) <= number + 99 :
                    new.write(f"{sequence} \n")





