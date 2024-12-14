#!/usr/bin/python3


window_size = 30

ofset = 3

exon = open("Remote_sequence_coding.fasta").read().split()[1]

start = list(range(0,len(exon), ofset))

for number in start :
    window = exon[number:number + window_size]
    gc = int(((window.count('G') + window.count('C')) / len(window)) * 100)
    with open(f"AJ223353_{window}.fasta", "w") as many_files :
        many_files.write(f"> AJ223353_coding_{len(window)}_{window}_window{window_size}_offset{ofset} \n {window}")
    with open(f"AJ223353_all.fasta", "a") as all_files :
        all_files.write(f"{window} GC content: {gc} \n")

    print(f"{window} GC content: {gc}")


