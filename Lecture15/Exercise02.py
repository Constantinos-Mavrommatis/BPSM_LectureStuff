#!/usr/bin/python3

def base_counter(sequence, threshold = 50) :
    try :
        total_count = 0
        for i in "ATGC" :
            count = sequence.upper().count(i)
            total_count = total_count + count
        return(((int(len(sequence)) - total_count) / len(sequence)*100) > threshold)
    except ZeroDivisionError:
        return False

        

print(base_counter("TPP", 50))

assert base_counter("",50) == False
