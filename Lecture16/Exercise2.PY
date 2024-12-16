#!/usr/bin/python3

gencode = {
'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
'TAC':'Y', 'TAT':'Y', 'TAA':'_', 'TAG':'_',
'TGC':'C', 'TGT':'C', 'TGA':'_', 'TGG':'W'}

#sequence = "ATGTTCGTGACGAGGGT"

#frames = list(range(0,len(sequence) - 2 ,3))

def translate_dna(sequence,direction,frame) :
    if direction == "forward" :
        for base in frame :
            frames = list(range(base - 1,len(sequence) - 2 ,3))
            protein = []
            for frame in frames :
                coton = sequence[frame : frame + 3]
                protein.append(gencode[coton])
                print(f"Base:{base}\tCoton:{coton}\tProtein:{protein}")
    elif direction == "reverse" :
        sequence = sequence.replace("A","t").replace("T","a").replace("G","c").replace("C","g").upper()
        reverse = sequence[::-1]
        for base in frame :
            frames = list(range( abs(base) - 1 , len(sequence) - 2 , 3))
            print(frames)
            protein = []
            for frame in frames :
                coton = reverse[frame : frame + 3]
                protein.append(gencode[coton])
                print(f"Base:{base}\tCoton:{coton}\tProtein:{protein}")


translate_dna("ATGTTCGGT","reverse",[-1,-2,-3])
