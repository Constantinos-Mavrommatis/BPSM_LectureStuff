#!/usr/bin/python3

def percentage_of_makeup(sequence, amino_acid = ["A", "I", "L", "M", "F", "W", "Y", "V"] ) :
    total_counts = 0
    for i in amino_acid :
        counts = sequence.upper().count(i)
        total_counts = total_counts + int(counts)
    percentage = (total_counts / len(sequence)) * 100
    return percentage

assert round(percentage_of_makeup("MSRSLLLRFLLFLLLLPPLP","M")) == round(5)
assert round(percentage_of_makeup("MSRSLLLRFLLFLLLLPPLP", ['F', 'S', 'L'])) == 70
assert round(percentage_of_makeup("MSRSLLLRFLLFLLLLPPLP")) == 65



