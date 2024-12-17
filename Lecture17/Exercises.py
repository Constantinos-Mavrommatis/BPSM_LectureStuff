#!/usr/bin/python3

import os, sys, subprocess
import pandas as pd
import numpy as np


eukaryotes = pd.read_csv("eukaryotes.txt",sep="\t")

Question01 =  eukaryotes[(eukaryotes["Group"] == "Fungi") & (eukaryotes["Size (Mb)"] > 100)]["#Organism/Name"]

names = '\n'.join(set(Question01))

print(f"The amount fo fungal species is {len(Question01)} and there names are: {names}")

Groups = ["plants","animals","fungi","protists"]

for group in Groups :
    amount = len(eukaryotes[eukaryotes["Group"].str.lower() == group])
    print(f"\nAmount of {group} sequenced is: {amount}")

Question03 = eukaryotes[(eukaryotes["#Organism/Name"].str.startswith("Heliconius"))]

print(Question03[ ["#Organism/Name","Scaffolds"] ])

Question04 = eukaryotes[eukaryotes["Group"] == "Fungi"]["Center"]

print(Question04.value_counts().head(1))
