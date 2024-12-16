#!/usr/bin/python3

def kmer_counting(sequence, kmer_length, threshold) :
    window_range = range(0, len(sequence) - kmer_length + 1)
    kmer_sequences = []
    for numbers in window_range :
        kmer_sequences = kmer_sequences + [sequence[numbers : numbers + kmer_length]]
    unique_kmer = list(set(kmer_sequences))
    for i in unique_kmer :
        count = kmer_sequences.count(i)
        if count > threshold :
            print(i)




kmer_counting("ATGCATCAGTG", 1, 2)
