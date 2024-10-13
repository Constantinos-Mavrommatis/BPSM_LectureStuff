#!/usr/bin/bash

#Fields: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score

inputfile="/localdisk/home/s2748062/Exercises/Lecture06_Practice/Exercises/blastoutput2.out"

echo -e "${inputfile}"
unset IFS

while read wholeline
do
	goodlines=$(grep -v "#" | wc -l)
	echo -e "There are ${goodlines} lines in the file"
	# We need to get all the lines without the "#"
	if [[ "${wholeline:0:1}" != "#" ]]
	then
		read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline}
		echo -e "${S_acc}" >> Subject_accessions.exercise.out
	fi




	# We need to list the subject accession filed

done < ${inputfile}


	

