#!/usr/bin/bash


input="$PWD/*.fq.gz"

File_name=$(cat Tco2.fqfiles | awk 'BEGIN{FS="\t";}{print $1, $6, $7;}' | grep "Tco") 
Output="$PWD/Outputs"
rm -f /localdisk/home/s2748062/Exercises/Lecture07/My_First_Pipeline/Outputs/Tco* 

while read File_Name Pair_1 Pair_2
do
	echo -e "Proccessing: ${File_Name} with ${Pair_1}\t${Pair_2}"
	fastqc -o ${Output} -t 128 ${Pair_1} ${Pair_2}


done <<< ${File_name}











