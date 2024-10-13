#!/usr/bin/bash

#Fields: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score

inputfile="/localdisk/home/s2748062/Exercises/Lecture06_Practice/Exercises/blastoutput2.out"

echo -e "${inputfile}"
rm -f *.exercise.out

read -p  "Would you like a list of all the Subject Acessions of the Hpos (YES/NO): " run_S_acc

if [[ "${run_S_acc}" == YES ]]
then
	while read wholeline
	do
		if [[ "${wholeline:0:1}" != "#" ]]  # We need to get all the lines without the "#"
		then
			read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline} #Here we seperating the fields 
			echo -e "${S_acc}"
			echo -e "${S_acc}" >> Subject_accessions.exercise.out #We list the subject access
		fi
	
	done < ${inputfile}
echo -e "DONE"
else
	echo "Skipping"
fi
	

